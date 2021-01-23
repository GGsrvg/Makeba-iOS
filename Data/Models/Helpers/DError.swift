//
//  DError.swift
//  Data
//
//  Created by GGsrvg on 04.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public enum TypeError {
    case database
    case network(statusCode: Int)
}

public class DError: Error {
    
    public let typeError: TypeError
    
    public let message: String
    
    internal init(typeError: TypeError, message: String) {
        self.typeError = typeError
        self.message = message
    }
}

