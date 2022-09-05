//
//  NetworkError.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/02.
//

import Foundation

enum NetworkError: Error {
    case pathErr
    case serverErr
    case decodedErr
    case invalidErr
    case networkFail
    case imageCacheErr
}
