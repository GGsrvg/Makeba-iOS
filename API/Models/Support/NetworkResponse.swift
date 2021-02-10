//
//  NetworkResponse.swift
//  Data
//
//  Created by GGsrvg on 07.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation


public class NetworkResponse<D> {
    
    public let statusCode: StatusCode
    public let data: D
    
    init(statusCode: StatusCode, data: D) {
        self.statusCode = statusCode
        self.data       = data
    }
    
    init(statusCode: Int, data: D) {
        self.statusCode = StatusCode(rawValue: statusCode) ?? .badGateway
        self.data       = data
    }
}
