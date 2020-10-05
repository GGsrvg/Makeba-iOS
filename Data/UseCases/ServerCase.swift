//
//  ServerCase.swift
//  Data
//
//  Created by GGsrvg on 29.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public protocol ServerCase: BaseCase {
    func get()                      -> Single<[Server]>
    func save(_ server: Server)     -> Single<Bool>
    func delete(_ server: Server)   -> Single<Bool>
    func update(_ server: Server)   -> Single<Bool>
}
