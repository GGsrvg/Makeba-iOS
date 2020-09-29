//
//  ServerEntity+CoreDataProperties.swift
//  
//
//  Created by GGsrvg on 13.09.2020.
//
//

import Foundation
import CoreData


extension ServerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ServerEntity> {
        return NSFetchRequest<ServerEntity>(entityName: "ServerEntity")
    }

    @NSManaged public var dateCreated: Date?
    @NSManaged public var name: String?
    @NSManaged public var path: String?

}
