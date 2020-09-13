//
//  NetworkStatus.swift
//  Data
//
//  Created by GGsrvg on 02.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

internal class NetworkStatus<D : BaseResponse> {
    internal init(statusCode: Int, message: String, modelResponse: D?) {
        self.statusCode = statusCode
        self.message = message
        self.modelResponse = modelResponse
    }
    
    let statusCode: Int
    let message: String
    let modelResponse: D?
}
