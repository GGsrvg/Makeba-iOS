//
//  ServerCase.swift
//  Data
//
//  Created by GGsrvg on 29.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import Storage
import DataModels

public class ServerCase: BaseCase {
    public var objectState: BehaviorSubject<ObjectState<Server>?> = .init(value: nil)
    
    let entityCase: ServerEntityCase
    
    public init(entityCase: ServerEntityCase) {
        self.entityCase = entityCase
    }
    
    public func get() -> Single<[Server]> {
        return .create(subscribe: { single in
            let serverEntities = self.entityCase.get()
            guard let serverEntity = serverEntities.data, serverEntities.isSuccessfullyCompleted else {
                single(.error(CError.init(message: serverEntities.message)))
                return Disposables.create()
            }
            single(.success(serverEntity))
            return Disposables.create()
        })
    }
    
    public func save(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let addStatus = self.entityCase.add(server: server)
            if addStatus.isSuccessfullyCompleted {
                single(.success(true))
                self.objectState.onNext(ObjectState.add(value: server))
            } else {
                single(.error(CError.init(message: addStatus.message)))
            }
            return Disposables.create()
        })
    }
    
    public func delete(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let deleteStatus = self.entityCase.delete(server: server)
            if deleteStatus.isSuccessfullyCompleted {
                single(.success(deleteStatus.data))
                self.objectState.onNext(ObjectState.delete(value: server))
            } else {
                single(.error(CError.init(message: deleteStatus.message)))
            }
            return Disposables.create()
        })
    }
    
    public func update(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let status = self.entityCase.update(server: server)
            if status.isSuccessfullyCompleted {
                single(.success(status.data))
                self.objectState.onNext(ObjectState.update(value: server))
            } else {
                single(.error(CError.init(message: status.message)))
            }
            return Disposables.create()
        })
    }
}
