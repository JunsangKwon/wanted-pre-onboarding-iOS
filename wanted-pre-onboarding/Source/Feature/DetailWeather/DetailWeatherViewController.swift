//
//  DetailWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/02.
//

import UIKit

final class DetailWeatherViewController: UIViewController {
    
    let detailWeatherView = DetailWeatherView(weatherInfo: WeatherEntity(description: "맑음", icon: "01d", temp: 20.23, feelLikeTemp: 20.21, maxTemp: 29.1, minTemp: 23.2, pressure: 1015, humidity: 58, windSpeed: 3.09, koreaName: "서울특별시"))
    
    override func loadView() {
        self.view = detailWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
