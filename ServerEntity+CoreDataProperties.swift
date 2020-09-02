//
//  ServerEntity+CoreDataProperties.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//
//

import Foundation
import CoreData


extension ServerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ServerEntity> {
        return NSFetchRequest<ServerEntity>(entityName: "ServerEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var path: String?
    @NSManaged public var characteristic: String?
    @NSManaged public var dateCreated: Date?

}
