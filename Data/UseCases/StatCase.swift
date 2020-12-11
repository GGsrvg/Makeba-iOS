//
//  StatCase.swift
//  Data
//
//  Created by GGsrvg on 06.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public protocol StatCase: BaseCase {
    func get(server: Server) -> Single<[Stats]>
}
