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

    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }

    public init(items: [DiagramItem]?) {
        self.items = items
    }
}
