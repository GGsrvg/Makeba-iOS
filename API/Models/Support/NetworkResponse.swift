//
//  NetworkResponse.swift
//  Data
//
//  Created by GGsrvg on 07.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import DataModels

public class NetworkResponse<D : Codable> {
    
    public let statusCode: StatusCode
    public let container: ContainerResponse<D>
    
    init(statusCode: StatusCode, container: ContainerResponse<D>) {
        self.statusCode = statusCode
        self.container  = container
    }
    
    init(statusCode: Int, container: ContainerResponse<D>) {
        self.statusCode = StatusCode(rawValue: statusCode) ?? .badGateway
        self.container  = container
    }
}
