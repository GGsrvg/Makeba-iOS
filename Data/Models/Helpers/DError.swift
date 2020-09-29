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

public protocol DError: Error {
    
    var typeError: TypeError { get }
    
    var message: String { get }
    
//    init(typeError: TypeError, message: String)
//    {
//        self.typeError = typeError
//        self.message = message
//    }
}
