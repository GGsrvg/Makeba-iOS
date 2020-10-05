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
    weak var coreDataStack: CoreDataStack!
    
    public init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
}

extension BaseEntityCase {
    var context: NSManagedObjectContext
    {
        get {
            return coreDataStack.context
        }
    }
    
    func save() throws {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                throw error
            }
        }
    }
}
