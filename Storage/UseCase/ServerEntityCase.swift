//
//  ServerEntityCase.swift
//  Data
//
//  Created by GGsrvg on 30.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import CoreData
import Data

public class ServerEntityCase: BaseEntityCase {
    
    public func get() -> DBStatus<[Server]?>
    {
        let request: NSFetchRequest<ServerEntity> = ServerEntity.fetchRequest()
        do {
            let serverEntities = try context.fetch(request)
            var servers: [Server] = []
            serverEntities.forEach {
                servers.append(Server(name: $0.name ?? "", path: $0.path ?? "", dateCreated: $0.dateCreated ?? Date()))
            }
            return .init(data: servers)
        } catch {
            return .init(isSuccessfullyCompleted: false, message: error.localizedDescription, data: nil)
        }
    }
    
    public func add(server: Server) -> DBStatus<Bool> {
        _ = ServerEntity(context: context, model: server)
        do {
            try save()
            return .init(data: true)
        } catch {
            return .init(isSuccessfullyCompleted: false, message: error.localizedDescription, data: false)
        }
    }
    
    public func delete(server: Server) -> DBStatus<Bool> {
        let request: NSFetchRequest<ServerEntity> = ServerEntity.fetchRequest()
        do {
            let servers = try context.fetch(request)
            guard let deleteServer = servers.first(where: { $0.name == server.name }) else { return .init(data: false) }
            context.delete(deleteServer)
            try save()
            return .init(data: true)
        } catch {
            return .init(isSuccessfullyCompleted: false, message: error.localizedDescription, data: false)
        }
    }
}
