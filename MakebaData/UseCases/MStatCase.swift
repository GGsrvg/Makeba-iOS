//
//  MStatCase.swift
//  MakebaData
//
//  Created by GGsrvg on 22.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import Data
import Storage
import API

final class MStatCase: StatCase {
    func get(server: Server) -> Single<[Stats]> {
        .just([])
    }
}
