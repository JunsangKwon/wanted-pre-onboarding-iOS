//
//  CityWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherViewController: UIViewController {
    
    override func loadView() {
        self.view = CityWeatherView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
