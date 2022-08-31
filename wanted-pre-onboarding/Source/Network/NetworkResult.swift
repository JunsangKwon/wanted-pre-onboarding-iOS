//
//  NetworkResult.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/08/31.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case serverErr
    case decodedErr
    case noDataErr
    case networkFail
}
