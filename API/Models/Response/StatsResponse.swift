//
//  StatsResponse.swift
//  Data
//
//  Created by GGsrvg on 20.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import DataModels

public struct StatsResponse: BaseResponse {
    public let message: String?
    public let errorMessage: String?
    public let data: [Stats]
    
    public enum CodingKeys: String, CodingKey {
        case message = "Message"
        case errorMessage = "ErrorMessage"
        case data = "Data"
    }
}
