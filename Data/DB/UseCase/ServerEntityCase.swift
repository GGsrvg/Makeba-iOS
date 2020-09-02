//
//  ServerEntityCase.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import CoreData

public class ServerEntityCase: BaseEntityCase {
//    public required init() { }
    
    func get() -> [ServerEntity] {
        let request:  NSFetchRequest<ServerEntity> = ServerEntity.fetchRequest()
        let servers = (try? context.fetch(request)) ?? []
        return servers
    }
    
    func add() {
        
    }
}
