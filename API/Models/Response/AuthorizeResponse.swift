//
//  AuthorizeResponse.swift
//  API
//
//  Created by GGsrvg on 16.01.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation

public struct AuthorizeResponse: BaseResponse {
    public let message: String?
    public let errorMessage: String?
    public let token: String?
    
    public init(message: String?, errorMessage: String?, token: String?) {
        self.message = message
        self.errorMessage = errorMessage
        self.token = token
    }
}
