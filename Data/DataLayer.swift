//
//  DataLayer.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import API
import Storage

public class DataLayer {
    private let api: Requests
    private let db: CoreDataStack
    
    public let server: ServerCase
    public let stat: StatCase
    
    public init() {
        api = Requests()
        db = CoreDataStack()
        
        server = ServerCase(entityCase: ServerEntityCase(coreDataStack: db))
        stat = StatCase(api: api)
    }
    
}
