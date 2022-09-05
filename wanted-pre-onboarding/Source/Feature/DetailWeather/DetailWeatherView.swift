//
//  DetailWeatherView.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/02.
//

import UIKit

final class DetailWeatherView: UIView {
    
    private var weatherInfo: WeatherEntity
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = weatherInfo.koreaName
        label.textColor = .systemColor
        label.textAlignment = .left
        label.font = .titleBoldFont
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = weatherInfo.description
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .mediumFont
        return label
    }()
    
    private lazy var weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "\(weatherInfo.temp)°"
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .bigFont
        return label
    }()
    
    private let temparatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    private let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "최고 :"
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .normalFont
        return label
    }()
    
    private lazy var maxTemperatureValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(weatherInfo.maxTemp)°"
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .normalFont
        return label
    }()
    
    private let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "최저 :"
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .normalFont
        return label
    }()
    
    private lazy var minTemperatureValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(weatherInfo.minTemp)°"
        label.textColor = .systemColor
        label.textAlignment = .right
        label.font = .normalFont
        return label
    }()
    
    private let extraInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let detailInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var feelLikeInfoView: DetailInfoView = {
        let infoView = DetailInfoView(title: "체감온도", info: "\(weatherInfo.feelLikeTemp)°")
        return infoView
    }()
    
    private lazy var airPressureInfoView: DetailInfoView = {
        let infoView = DetailInfoView(title: "기압", info:"\(weatherInfo.pressure)hPa")
        return infoView
    }()
    
    private lazy var humidityInfoView: DetailInfoView = {
        let infoView = DetailInfoView(title: "습도", info: "\(weatherInfo.humidity)%")
        return infoView
    }()
    
    private lazy var windSpeedInfoView: DetailInfoView = {
        let infoView = DetailInfoView(title: "풍속", info: "\(weatherInfo.windSpeed)m/s")
        return infoView
    }()
    
    init(weatherInfo: WeatherEntity) {
        self.weatherInfo = weatherInfo
        super.init(frame: .zero)
        setLayouts()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayouts() {
        self.backgroundColor = .systemBackground
        setImageCache()
        setViewHierarchy()
        setConstraints()
    }
    
    private func setImageCache() {
        Task {
            try await weatherIconImageView.setImage(weatherInfo.icon)
        }
    }
    
    private func setViewHierarchy() {
        addSubviews(mainStackView, extraInfoView)
        mainStackView.addArrangedSubviews(cityNameLabel,descriptionLabel, weatherIconImageView, temperatureLabel, temparatureStackView)
        temparatureStackView.addArrangedSubviews(maxTemperatureLabel, maxTemperatureValueLabel, Spacer(10), minTemperatureLabel, minTemperatureValueLabel)
        extraInfoView.addSubview(detailInfoStackView)
        detailInfoStackView.addArrangedSubviews(feelLikeInfoView, airPressureInfoView, humidityInfoView, windSpeedInfoView)
    }

    private func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        [mainStackView, weatherIconImageView, extraInfoView, detailInfoStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        
        weatherIconImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        weatherIconImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        extraInfoView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        extraInfoView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        extraInfoView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        extraInfoView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20).isActive = true
        
        detailInfoStackView.topAnchor.constraint(equalTo: extraInfoView.topAnchor).isActive = true
        detailInfoStackView.leadingAnchor.constraint(equalTo: extraInfoView.leadingAnchor).isActive = true
        detailInfoStackView.trailingAnchor.constraint(equalTo: extraInfoView.trailingAnchor).isActive = true
        detailInfoStackView.bottomAnchor.constraint(equalTo: extraInfoView.bottomAnchor).isActive = true
    }
}
