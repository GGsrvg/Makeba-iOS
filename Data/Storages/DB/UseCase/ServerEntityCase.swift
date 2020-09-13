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
    
    func get() -> DBStatus<[ServerEntity]?> {
        let request:  NSFetchRequest<ServerEntity> = ServerEntity.fetchRequest()
        do {
            let servers = try context.fetch(request)
            return .init(data: servers)
        } catch {
            return .init(isSuccessfullyCompleted: false, message: error.localizedDescription, data: nil)
        }
    }
    
    func add(server: Server) -> DBStatus<Bool> {
        _ = ServerEntity(context: context, model: server)
        do {
            try save()
            return .init(data: true)
        } catch {
            return .init(isSuccessfullyCompleted: false, message: error.localizedDescription, data: false)
        }
    }
}
