//
//  BaseResponse.swift
//  Data
//
//  Created by GGsrvg on 02.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

protocol BaseResponse: Codable {
    associatedtype Object: Any
    
    var message: String { get }
    var errorMessage: String { get }
    var data: Object { get }
}
