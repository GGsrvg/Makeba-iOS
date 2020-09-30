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
//public class StatCase: BaseCase<BaseEntityCase> {
//    public func get(server: Server) -> Single<[Stats]> {
//        return network.stats(server: server)
//            .catchError({ error in
//                guard let networkError = error as? NetworkError else { fatalError("Error is not equil type of the NetworkError") }
//                let correctError = QueryError(typeError: .network(statusCode: 0), message: networkError.message)
//                return .error(correctError)
//            })
//            .map({ response -> [Stats] in
//                var result: [Stats] = []
//                guard let data = response.data else {
//                    print(response)
//                    throw QueryError(typeError: .network(statusCode: response.statusCode), message: response.description)
//                }
//                
//                for container in data.data {
//                    var parsedStats: [Stat]? = nil
//                    if let stats = container.stats {
//                        parsedStats = []
//                        for stat in stats {
//                            parsedStats?.append(
//                                .init(
//                                    type: stat.type,
//                                    title: stat.title,
//                                    model: .init(
//                                        text: stat.model?.text,
//                                        axis: stat.model?.axis,
//                                        textAligment: stat.model?.textAligment)
//                                )
//                            )
//                        }
//                    }
//                    result.append(.init(title: container.title, stats: parsedStats))
//                }
//                return result
//            })
//    }
//}