//
//  CError.swift
//  DataModels
//
//  Created by GGsrvg on 11.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation

public class CError: LocalizedError {
    
    /**
     if `statusCode` is nil, then the error not is not network network related
     */
    public let statusCode: StatusCode?
    
    public let message: String?
    
    public var errorDescription: String? {
        return message
    }

    public init(message: String?, statusCode: StatusCode? = nil) {
        self.message = message
        self.statusCode = statusCode
    }
}

public extension CError {
    class var urlNotCorrect: CError {
        // TODO: localize
        let message = "URL not correct. Please check."
        return CError(message: message)
    }
    
    class var objectDataNil: CError {
        // TODO: localize
        let message = "Response nil."
        return CError(message: message)
    }
    
    class func failedConvert<T>(to type: T) -> CError {
        // TODO: localize
        let message = "Failed convert to \(type)."
        return CError(message: message)
    }
    
    class func unknownErrorCode(_ code: Int) -> CError {
        // TODO: localize
        let message = "Code \"\(code)\" is not processed. You may be using a different version of api."
        return CError(message: message)
    }
}
