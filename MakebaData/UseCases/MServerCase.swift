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
    func get() -> Single<[Server]> {
        .just([])
    }
    
    func save(_ server: Server) -> Single<Bool> {
        .just(false)
    }
    
    func delete(_ server: Server) -> Single<Bool> {
        .just(false)
    }
    
    func update(_ server: Server) -> Single<Bool> {
        .just(false)
    }
    
}
