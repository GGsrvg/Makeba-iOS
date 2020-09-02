//
//  BaseCase.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class BaseCase<EC : BaseEntityCase, N> {
    let entityCase: EC
    
    init(coreDataStack: CoreDataStack) {
        entityCase = EC.init(coreDataStack: coreDataStack)
    }
}
