//
//  Stats.swift
//  Data
//
//  Created by GGsrvg on 28.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Stats: Codable {
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case stats = "Stats"
    }
    
    public let title: String?
    public let stats: [Stat]
    
    public init(title: String?, stats: [Stat]) {
        self.title = title
        self.stats = stats
    }
}
