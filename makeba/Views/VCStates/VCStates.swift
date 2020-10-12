//
//  VCStates.swift
//  makeba
//
//  Created by GGsrvg on 06.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

enum VCStates {
    case content
    case dataEmpty
    case loading
    case error(message: String)
    case noInternet
    
    mutating func next() {
        switch self {
        case .content:
            self = .dataEmpty
        case .dataEmpty:
            self = .loading
        case .loading:
            self = .error(message: "")
        case .error(message: let message):
            self = .noInternet
        case .noInternet:
            self = .content
        }
    }
}
