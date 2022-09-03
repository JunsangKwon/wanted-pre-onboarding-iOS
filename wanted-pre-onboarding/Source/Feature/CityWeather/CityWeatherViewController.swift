//
//  CityWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherViewController: UIViewController {
    
    let cityNameDic: [String : String] = ["Gongju": "공주시", "Gwangju": "광주광역시", "Gumi": "구미시", "Gunsan": "군산시", "Daegu": "대구시", "Daejeon": "대전광역시", "Mokpo": "목포시", "Busan": "부산광역시", "Seosan": "서산시", "Seoul": "서울특별시", "Sokcho": "속초시", "Suwon": "수원시", "Suncheon": "순천시", "Ulsan": "울산시", "Iksan": "익산시", "Jeonju": "전주시", "Jeju": "제주특별시", "Cheonan": "천안시", "Cheongju": "청주시", "Chuncheon":"춘천시"]
    let cityWeatherView = CityWeatherView()
    var weatherList: [WeatherEntity] = []
    
    override func loadView() {
        self.view = cityWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        getCityWeatherInfo()
    }
    
    private func registerCollectionView() {
        cityWeatherView.collectionView.delegate = self
        cityWeatherView.collectionView.dataSource = self
    }

    private func getCityWeatherInfo() {
        Task {
            for (key, value) in cityNameDic {
                do {
                    var data = try await NetworkService.shared.getWeatherInfo(cityName: key)
                    data.koreaName = value
                    self.weatherList.append(data)
                } catch {
                    print(error.localizedDescription)
                }
            }
            await MainActor.run {
                self.weatherList.sort(by: {$0.koreaName! < $1.koreaName!})
                self.cityWeatherView.collectionView.reloadData()
            }
        }
    }
}

extension CityWeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityWeatherCell", for: indexPath) as? CityWeatherCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.setData(info: self.weatherList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 60 , height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailWeatherViewController(weatherInfo: weatherList[indexPath.item])
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
