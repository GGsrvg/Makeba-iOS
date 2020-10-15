//
//  VCStates.swift
//  makeba
//
//  Created by GGsrvg on 06.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

enum VCStates {
    case content
    case loading
    case error(title: String?, message: String?, retryTitle: String?, retryAction: ErrorState.ErrorRetryAction?)
    case dataEmpty
    case noInternet
    
    mutating func next() {
        switch self {
        case .content:
            self = .loading
        case .loading:
            self = .error(title: "Data empty", message: "No data", retryTitle: "Retry", retryAction: { _ in
                print("retry")
            })
        case .error:
            self = .dataEmpty
        case .dataEmpty:
            self = .noInternet
        case .noInternet:
            self = .content
        }
    }
}
