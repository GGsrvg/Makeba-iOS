//
//  NetworkError.swift
//  Data
//
//  Created by GGsrvg on 13.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

class NetworkError: Error {
    enum ErrorType {
        case noInternet
        case url
        case jsonNotCorrect
        case custom
    }
    
    let type: ErrorType
    let message: String
    
    internal init(type: NetworkError.ErrorType, message: String) {
        self.type = type
        self.message = message
    }
    
    internal init(message: String) {
        self.type = .custom
        self.message = message
    }
    
    internal init(type: NetworkError.ErrorType) {
        self.type = type
        switch type {
        case .noInternet:
            self.message = "No internet access"
        case .url:
            self.message = "URL not correct"
        case .jsonNotCorrect:
            self.message = "JSON not correct"
        case .custom:
            fatalError("If you need use \"custom\" type, use init(message: String)")
        }
    }
}
