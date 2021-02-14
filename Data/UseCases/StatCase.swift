//
//  StatCase.swift
//  Data
//
//  Created by GGsrvg on 06.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import API
import DataModels

public class StatCase: BaseCase {
    
    private weak var api: Requests!
    
    init(api: Requests) {
        self.api = api
    }
    
    public func get(server: Server) -> Single<[Stats]> {
        return api.stats(server: server)
            .map({ response -> [Stats] in
                switch response.statusCode {
                case .ok:
                    guard let stats = response.container.data else {
                        throw CError.init(message: response.container.message)
                    }
                    return stats
                default:
                    throw CError.init(message: response.container.message, statusCode: response.statusCode)
                }
            })
    }
}
