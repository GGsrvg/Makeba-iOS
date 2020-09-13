//
//  StatCase.swift
//  Data
//
//  Created by GGsrvg on 06.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public class StatCase: BaseCase<BaseEntityCase> {
    public func get(server: Server) -> Single<[StatsContainer]> {
        return network.stats(server: server)
            .map({ statsContainers -> [StatsContainer] in
                var result: [StatsContainer] = []
                for container in statsContainers.data {
                    var parsedStats: [Stat]? = nil
                    if let stats = container.stats {
                        parsedStats = []
                        for stat in stats {
                            parsedStats?.append(
                                .init(
                                    type: stat.type,
                                    title: stat.title,
                                    model: .init(
                                        text: stat.model?.text,
                                        axis: stat.model?.axis,
                                        textAligment: stat.model?.textAligment)
                                )
                            )
                        }
                    }
                    result.append(.init(title: container.title, stats: parsedStats))
                }
                return result
            })
    }
}
