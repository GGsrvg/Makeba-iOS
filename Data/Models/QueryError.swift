//
//  QueryError.swift
//  Data
//
//  Created by GGsrvg on 04.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public final class QueryError: Error {
    
    public let typeError: TypeError
    
    public let message: String
    
    public var localizedDescription: String {
        get {
            message
        }
    }
    
    internal init(typeError: QueryError.TypeError, message: String) {
        self.typeError = typeError
        self.message = message
    }
}

extension QueryError {
    public enum TypeError {
        case database
        case network(statusCode: Int)
    }
}
