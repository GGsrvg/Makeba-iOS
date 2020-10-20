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
    case error(_ error: Error)
    case dataEmpty
    case noInternet
}
