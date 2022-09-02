//
//  NetworkService.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/31.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    public func getWeatherInfo(cityName: String) async throws -> WeatherEntity {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?appid=ced6196732a06c7485c1feb058bc28c1&lang=kr&q=\(cityName)&units=metric") else { throw NetworkError.pathErr }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkError.invalidErr
        }
        let successRange = 200..<300
        
        guard successRange.contains(statusCode) else {
            throw NetworkError.serverErr
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(WeatherDTO.self, from: data)
        let weatherInfo = WeatherEntity(description: result.weather.first?.weatherDescription ?? "",
                                        icon: result.weather.first?.icon ?? "unknown",
                                        temp: result.main.temp,
                                        feelLikeTemp: result.main.feelsLike,
                                        maxTemp: result.main.tempMax,
                                        minTemp: result.main.tempMin,
                                        pressure: result.main.pressure,
                                        humidity: result.main.humidity,
                                        windSpeed: result.wind.speed,
                                        koreaName: nil)
        
        return weatherInfo
    }
}
