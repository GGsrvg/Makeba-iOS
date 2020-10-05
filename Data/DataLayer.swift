//
//  DataLayer.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public protocol DataLayer: class {
    var server: ServerCase { get }
    var stat: StatCase { get }
}
