//
//  MServerCase.swift
//  MakebaData
//
//  Created by GGsrvg on 22.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import Data
import API
import Storage

final class MServerCase: ServerCase {
    let entityCase: ServerEntityCase
    
    public init(entityCase: ServerEntityCase) {
        self.entityCase = entityCase
    }
    
    func get() -> Single<[Server]> {
        return .create(subscribe: { single in
            let serverEntities = self.entityCase.get()
            guard let serverEntity = serverEntities.data, serverEntities.isSuccessfullyCompleted else {
                single(.error(MDError(typeError: .database, message: serverEntities.message)))
                return Disposables.create()
            }
            single(.success(serverEntity))
            return Disposables.create()
        })
    }
    
    func save(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let addStatus = self.entityCase.add(server: server)
            if addStatus.isSuccessfullyCompleted {
                single(.success(true))
            } else {
                single(.error(MDError(typeError: .database, message: addStatus.message)))
            }
            return Disposables.create()
        })
    }
    
    func delete(_ server: Server) -> Single<Bool> {
        return .create(subscribe: { single in
            let addStatus = self.entityCase.delete(server: server)
            if addStatus.isSuccessfullyCompleted {
                single(.success(addStatus.data))
            } else {
                single(.error(MDError(typeError: .database, message: addStatus.message)))
            }
            return Disposables.create()
        })
    }
    
    func update(_ server: Server) -> Single<Bool> {
        .just(false)
    }
    
}
