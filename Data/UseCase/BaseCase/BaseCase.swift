//
//  BaseCase.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class BaseCase<EC : BaseEntityCase> {
    let entityCase: EC
    let network: Requests
    
    init(coreDataStack: CoreDataStack, network: Requests) {
        entityCase = EC.init(coreDataStack: coreDataStack)
        self.network = network
    }
}
