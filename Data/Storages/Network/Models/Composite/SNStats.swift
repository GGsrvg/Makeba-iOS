//
//  SNStats.swift
//  Data
//
//  Created by GGsrvg on 20.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

struct SNStats: Codable {
    let title: String?
    let stats: [SNStat]?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case stats = "Stats"
    }
}

