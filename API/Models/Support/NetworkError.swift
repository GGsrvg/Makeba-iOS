//
//  NetworkError.swift
//  Data
//
//  Created by GGsrvg on 13.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class NetworkError: LocalizedError {
    public let message: String
    
    public var errorDescription: String? {
        return message
    }

    internal init(message: String) {
        self.message = message
    }
}

public extension NetworkError {
    class var urlNotCorrect: NetworkError {
        // TODO: localize
        let message = "URL not correct. Please check."
        return NetworkError(message: message)
    }
    
    class var objectDataNil: NetworkError {
        // TODO: localize
        let message = "Response nil."
        return NetworkError(message: message)
    }
    
    class func failedConvert<T>(to type: T) -> NetworkError {
        // TODO: localize
        let message = "Failed convert to \(type)."
        return NetworkError(message: message)
    }
    
    class func unknownErrorCode(_ code: Int) -> NetworkError {
        // TODO: localize
        let message = "Code \"\(code)\" is not processed. You may be using a different version of api."
        return NetworkError(message: message)
    }
}
