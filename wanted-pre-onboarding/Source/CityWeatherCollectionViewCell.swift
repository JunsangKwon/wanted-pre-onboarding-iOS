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
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "unknown")
        return imageView
    }()
    
    let leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 25, weight: .light)
        return label
    }()
    
    let humidityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "humidity")
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14, weight: .light)
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
        stackView.distribution = .fill
        stackView.spacing = 7
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityNameLabel.text = ""
        weatherIconImageView.image = nil
        temperatureLabel.text = ""
        humidityLabel.text = ""
    }
    
    public func setData(info: WeatherEntity) {
        cityNameLabel.text = info.koreaName
        weatherIconImageView.image = UIImage(named: info.icon)
        temperatureLabel.text = "\(info.temp)°C"
        humidityLabel.text = "\(info.humidity)%"
    }

    private func setLayouts() {
        setProperties()
        setViewHierarchy()
        setConstraints()
    }
    
    private func setProperties() {
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
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
        leftStackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        rightStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        rightStackView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        weatherIconImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        humidityImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        humidityImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
