//
//  BaseResponse.swift
//  Data
//
//  Created by GGsrvg on 02.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public protocol BaseResponse: Codable {
    var message: String? { get }
    var errorMessage: String? { get }
}
