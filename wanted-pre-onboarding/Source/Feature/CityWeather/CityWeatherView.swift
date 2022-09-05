//
//  CityWeatherView.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.estimatedItemSize = .zero

        let collectionView = UICollectionView(frame: self.bounds,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CityWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "CityWeatherCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        addSubview(collectionView)
    }

    private func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
