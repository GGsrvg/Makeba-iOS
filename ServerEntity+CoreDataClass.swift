//
//  ServerEntity+CoreDataClass.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//
//

import Foundation
import CoreData


public class ServerEntity: NSManagedObject {
    convenience init(context: NSManagedObjectContext, model: Server) {
        self.init(context: context)
        name = model.name
        path = model.path
        characteristic = model.description
        dateCreated = model.dateCreated
    }
}
