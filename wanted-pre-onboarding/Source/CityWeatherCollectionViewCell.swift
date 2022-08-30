//
//  CityWeatherCollectionViewCell.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/30.
//

import UIKit

class CityWeatherCollectionViewCell: UICollectionViewCell {

    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "공주시"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19°C"
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    let humidityImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    let rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let humidStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
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
        setViewHierarchy()
        setConstraints()
    }

    private func setViewHierarchy() {
        contentView.addSubviews(leftStackView, rightStackView)
        leftStackView.addArrangedSubviews(
            cityNameLabel,
            weatherIconImageView)
        rightStackView.addArrangedSubviews(
            temperatureLabel,
            humidStackView)
        humidStackView.addArrangedSubviews(
            humidityImageView,
            humidityLabel)
    }

    private func setConstraints() {
        [leftStackView, rightStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        leftStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        leftStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        leftStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        rightStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        rightStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        weatherIconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        humidityImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        humidityImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
