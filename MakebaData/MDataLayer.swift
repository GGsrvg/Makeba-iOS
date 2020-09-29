//
//  MDataLayer.swift
//  MakebaData
//
//  Created by GGsrvg on 24.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data
import API
import Storage

public final class MDataLayer: DataLayer {
    public var server: ServerCase
    public var stat: StatCase
    
    public init() {
        server = MServerCase()
        stat = MStatCase()
    }
    
}
