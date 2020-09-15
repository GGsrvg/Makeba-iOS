//
//  ServerCase.swift
//  Data
//
//  Created by GGsrvg on 29.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public class ServerCase: BaseCase<ServerEntityCase> {
    
    public func get() -> Single<[Server]> {
        return .create(subscribe: { single in
            let serverEntities = self.entityCase.get()
            guard let data = serverEntities.data, serverEntities.isSuccessfullyCompleted else {
                single(.error(QueryError(typeError: .database, message: serverEntities.message)))
                return Disposables.create()
            }
            
            var servers: [Server] = []
            for serverEntity in data {
                servers.append(.init(name: serverEntity.name ?? "NIL", path: serverEntity.path ?? "NIL", dateCreated: serverEntity.dateCreated ?? .init()))
            }
            
            single(.success(servers))
            return Disposables.create()
        })
    }
    
    public func save(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let addStatus = self.entityCase.add(server: server)
            if addStatus.isSuccessfullyCompleted {
                single(.success(true))
            } else {
                single(.error(QueryError(typeError: .database, message: addStatus.message)))
            }
            return Disposables.create()
        })
    }
    
    public func delete(_ server: Server) {}
    public func update(_ server: Server) {}
}
