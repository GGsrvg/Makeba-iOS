//
//  ServerCase.swift
//  Data
//
//  Created by GGsrvg on 29.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public class ServerCase: BaseCase<ServerEntityCase, Any> {
    
    public func get() -> Single<[Server]> {
        return .create(subscribe: { single in
            let serverEntities = self.entityCase.get()
            var servers: [Server] = []
            
            for serverEntity in serverEntities {
                servers.append(.init(name: serverEntity.name ?? "NIL", path: serverEntity.path ?? "NIL", description: serverEntity.characteristic ?? "NIL", dateCreated: serverEntity.dateCreated ?? .init()))
            }
            
            single(.success(servers))
            return Disposables.create()
        })
    }
    
    public func save(_ server: Server) {}
    public func delete(_ server: Server) {}
    public func update(_ server: Server) {}
}
