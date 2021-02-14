//
//  AuthorizeResponse.swift
//  API
//
//  Created by GGsrvg on 16.01.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation

public struct AuthorizeResponse: Codable {
    public let token: String?
    
    public init(token: String?) {
        self.token = token
    }
}
