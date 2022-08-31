//
//  NetworkService.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/31.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    public func getWeatherInfo(cityName: String,
                           completion: @escaping(NetworkResult<Any>) -> Void) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?appid=ced6196732a06c7485c1feb058bc28c1&lang=kr&q=\(cityName)&units=metric") else { return }
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {data, response, error in
            guard error == nil else {
                completion(NetworkResult.networkFail)
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
            let successRange = 200..<300
            
            guard successRange.contains(statusCode) else {
                completion(NetworkResult.serverErr)
                return
            }

            guard let data = data else {
                completion(NetworkResult.noDataErr)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(WeatherDTO.self, from: data)
                completion(NetworkResult.success(response))
            } catch let error {
                completion(NetworkResult.decodedErr)
                print(String(describing: error))
            }
            
        }.resume()
    }
}
