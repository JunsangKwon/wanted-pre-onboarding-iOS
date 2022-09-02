//
//  CityWeatherView.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

final class CityWeatherView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.estimatedItemSize = .zero

        let collectionView = UICollectionView(frame: self.bounds,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(CityWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "CityWeatherCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.backgroundColor = .secondarySystemBackground
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        addSubviews(titleLabel, collectionView)
    }

    private func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
