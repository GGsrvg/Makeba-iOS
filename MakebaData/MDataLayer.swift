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
    private let api: Requests
    private let db: CoreDataStack
    
    public let server: ServerCase
    public let stat: StatCase
    
    public init() {
        api = Requests()
        db = CoreDataStack()
        
        server = MServerCase(entityCase: ServerEntityCase(coreDataStack: db))
        stat = MStatCase(api: api)
    }
    
}
