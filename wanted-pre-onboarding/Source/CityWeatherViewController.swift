//
//  CityWeatherViewController.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherViewController: UIViewController {
    
    let cityWeatherView = CityWeatherView()
    
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

extension CityWeatherViewController: UICollectionViewDelegate {
    
}

extension CityWeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityWeatherCell", for: indexPath) as? CityWeatherCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 60 , height: 80)
    }
    
}
