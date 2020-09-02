//
//  RequestStatus.swift
//  Data
//
//  Created by GGsrvg on 01.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class RequestStatus<D> {
    public enum TypeError {
        case none
        case database(message: String)
        case network(statusCode: Int, message: String)
        case unknow(message: String)
    }
    
    public let typeError: TypeError
    public let data: D
    
    internal init(typeError: RequestStatus<D>.TypeError, data: D) {
        self.typeError = typeError
        self.data = data
    }

}
