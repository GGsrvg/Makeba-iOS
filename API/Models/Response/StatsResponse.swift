//
//  StatsResponse.swift
//  Data
//
//  Created by GGsrvg on 20.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data

public struct StatsResponse: BaseResponse {
    var message: String?
    var errorMessage: String?
    var data: [Stats]
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case errorMessage = "ErrorMessage"
        case data = "Data"
    }
}
