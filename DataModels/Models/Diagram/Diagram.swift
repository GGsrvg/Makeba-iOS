//
//  Diagram.swift
//  Data
//
//  Created by GGsrvg on 09.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public struct Diagram: Codable {
    public let items: [DiagramItem]?
    public let type: DiagramType?

    enum CodingKeys: String, CodingKey {
        case items = "Items"
        case type = "Type"
    }

    public init(items: [DiagramItem]?, type: DiagramType?) {
        self.items = items
        self.type = type
    }
}
