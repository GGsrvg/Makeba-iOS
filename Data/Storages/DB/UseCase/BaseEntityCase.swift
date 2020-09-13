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
    internal let coreDataStack: CoreDataStack
    internal required init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    internal var context: NSManagedObjectContext {
        get {
            return coreDataStack.context
        }
    }
    
    internal func save() throws {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                throw error
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
