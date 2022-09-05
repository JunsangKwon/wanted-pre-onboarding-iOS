//
//  Bundle+Extension.swift
//  wanted-pre-onboarding
//
//  Created by 권준상 on 2022/09/05.
//

import Foundation

extension Bundle {
    
    var API_KEY: String {
        guard let file = self.path(forResource: "ApiKey", ofType: "plist") else { return "" }
        
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        
        guard let key = resource["API_KEY"] as? String else {
            fatalError("API_KEY error")
        }
        return key
    }
}
