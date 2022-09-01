//
//  CityWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherViewController: UIViewController {
    
    let cityWeatherView = CityWeatherView()
    let cityNameList = ["Gongju", "Gwangju", "Gumi", "Gunsan", "Daegu", "Daejeon", "Mokpo", "Busan", "Seosan", "Seoul", "Sokcho", "Suwon", "Suncheon", "Ulsan", "Iksan", "Jeonju", "Jeju", "Cheonan", "Cheongju-si", "Chuncheon"]
    
    override func loadView() {
        self.view = cityWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
    }
    
    private func registerCollectionView() {
        cityWeatherView.collectionView.delegate = self
        cityWeatherView.collectionView.dataSource = self
    }
}

extension CityWeatherViewController {
    func getCityWeatherInfo() {
        for i in 0..<cityNameList.count {
            NetworkService.shared.getWeatherInfo(cityName: cityNameList[i]) { [weak self] result in
                switch result {
                case .success(let response):
                    guard let data = response as? WeatherDTO else { return }
                    let weatherInfo = WeatherEntity(description: data.weather.first?.weatherDescription ?? "",
                                                    icon: data.weather.first?.icon ?? "unknown",
                                                    temp: data.main.temp,
                                                    feelLikeTemp: data.main.feelsLike,
                                                    maxTemp: data.main.tempMax,
                                                    minTemp: data.main.tempMin,
                                                    pressure: data.main.pressure,
                                                    humidity: data.main.humidity,
                                                    windSpeed: data.wind.speed,
                                                    name: data.name)
                    
                default:
                    print("API error")
                }
            }
        }
    }
}

extension CityWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityWeatherCell", for: indexPath) as? CityWeatherCollectionViewCell
        else { return UICollectionViewCell() }
        
        let cityName = cityNameList[indexPath.item]
        NetworkService.shared.getWeatherInfo(cityName: cityName) { result in
            switch result {
            case .success(let response):
                guard let data = response as? WeatherDTO else { return }
                let weatherInfo = WeatherEntity(description: data.weather.first?.weatherDescription ?? "",
                                                icon: data.weather.first?.icon ?? "unknown",
                                                temp: data.main.temp,
                                                feelLikeTemp: data.main.feelsLike,
                                                maxTemp: data.main.tempMax,
                                                minTemp: data.main.tempMin,
                                                pressure: data.main.pressure,
                                                humidity: data.main.humidity,
                                                windSpeed: data.wind.speed,
                                                name: data.name)
                DispatchQueue.main.async {
                    cell.setData(info: weatherInfo)
                }
            default:
                print("API error")
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 60 , height: 90)
    }
    
}
