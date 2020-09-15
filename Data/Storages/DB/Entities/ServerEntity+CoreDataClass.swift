//
//  ServerEntity+CoreDataClass.swift
//  
//
//  Created by GGsrvg on 13.09.2020.
//
//

import Foundation
import CoreData


public class ServerEntity: NSManagedObject {
    convenience init(context: NSManagedObjectContext, model: Server) {
        self.init(context: context)
        name = model.name
        path = model.path
        dateCreated = model.dateCreated
    }
}
