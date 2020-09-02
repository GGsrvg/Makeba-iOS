//
//  BaseEntityCase.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import CoreData

public class BaseEntityCase {
    let coreDataStack: CoreDataStack
    required init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    var context: NSManagedObjectContext {
        get {
            return coreDataStack.context
        }
    }
}
