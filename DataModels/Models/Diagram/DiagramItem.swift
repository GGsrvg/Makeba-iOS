//
//  DiagramItem.swift
//  Data
//
//  Created by GGsrvg on 09.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public struct DiagramItem: Codable {
    public let name: String?
    public let color: Color?
    public let numberVotes: Int?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case color = "Color"
        case numberVotes = "NumberVotes"
    }

    public init(name: String?, color: Color?, numberVotes: Int?) {
        self.name = name
        self.color = color
        self.numberVotes = numberVotes
    }
}
