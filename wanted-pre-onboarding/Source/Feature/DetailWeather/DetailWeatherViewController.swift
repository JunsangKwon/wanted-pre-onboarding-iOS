//
//  DetailWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/02.
//

import UIKit

final class DetailWeatherViewController: UIViewController {
    
    var weatherInfo: WeatherEntity
    lazy var detailWeatherView = DetailWeatherView(weatherInfo: self.weatherInfo)
    
    init(weatherInfo: WeatherEntity){
        self.weatherInfo = weatherInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = detailWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
