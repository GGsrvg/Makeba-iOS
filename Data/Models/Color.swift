//
//  Color.swift
//  Data
//
//  Created by GGsrvg on 09.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public struct Color: Codable {
    public let red:     Int
    public let green:   Int
    public let blue:    Int

    enum CodingKeys: String, CodingKey {
        case red    = "Red"
        case green  = "Green"
        case blue   = "Blue"
    }

    public init(red: Int?, green: Int?, blue: Int?) {
        self.red    = red ?? 0
        self.green  = green ?? 0
        self.blue   = blue ?? 0
    }
}
