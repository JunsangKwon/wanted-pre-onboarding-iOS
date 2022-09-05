//
//  UIImageView+Extension.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/05.
//

import UIKit.UIImageView

extension UIImageView {
    
    func setImage(_ iconName: String) async throws {
        let cachedKey = NSString(string: iconName)

        if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
            self.image = cachedImage
            return
        }
        
        Task {
            do {
                guard let url = URL(string: "https://openweathermap.org/img/wn/\(iconName)@2x.png") else {
                    throw NetworkError.pathErr
                }
                
                let (data, response) = try await URLSession.shared.data(from: url)

                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    throw NetworkError.invalidErr
                }
                let successRange = 200..<300
                
                guard successRange.contains(statusCode) else {
                    throw NetworkError.serverErr
                }
                
                try await MainActor.run {
                    if let image = UIImage(data: data) {
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self.image = image
                    } else {
                        throw NetworkError.imageCacheErr
                    }
                }
            } catch {
                await MainActor.run{
                    self.image = UIImage(named: "unknown")
                }
            }
        }
        
    }
}
