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
    
    private weak var api: Requests!
    
    init(api: Requests) {
        self.api = api
    }
    
    func get(server: Server) -> Single<[Stats]> {
        return api.stats(server: server)
            .catchError({ error in
                guard let networkError = error as? NetworkError else { fatalError("Error is not equil type of the NetworkError") }
                let correctError = MDError(typeError: .network(statusCode: 0), message: networkError.message)
                return .error(correctError)
            })
            .map({ response -> [Stats] in
                guard let data = response.data else {
                    throw MDError(typeError: .network(statusCode: response.statusCode), message: response.description)
                }
                return data.data
            })
    }
}
