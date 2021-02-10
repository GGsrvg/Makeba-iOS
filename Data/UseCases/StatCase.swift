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
            .catchError({ error in
                guard let networkError = error as? NetworkError else { fatalError("Error is not equil type of the NetworkError") }
                let correctError = DError(typeError: .network(statusCode: 0), message: networkError.message)
                return .error(correctError)
            })
            .map({ response -> [Stats] in
//                guard let data = response.data else {
//                    throw DError(typeError: .network(statusCode: response.statusCode), message: response.description)
//                }
                return response.data.data
            })
    }
}
