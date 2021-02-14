//
//  ContainerResponse.swift
//  API
//
//  Created by GGsrvg on 10.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation

public struct ContainerResponse<D : Codable>: Codable {
    public let message: String?
//    public let errorMessage: String?
    public let data: D?
    
    public enum CodingKeys: String, CodingKey {
        case message = "Message"
//        case errorMessage = "ErrorMessage"
        case data = "Data"
    }
}
