//
//  ImageCacheManager.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/05.
//

import UIKit

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}
