//
//  AuthorizeRequest.swift
//  API
//
//  Created by GGsrvg on 16.01.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation

public struct AuthorizeRequest {
    public let login: String
    public let password: String
    
    public init(login: String, password: String) {
        self.login = login
        self.password = password
    }
}
