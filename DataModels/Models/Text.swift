//
//  Text.swift
//  Data
//
//  Created by GGsrvg on 28.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Text: Codable {
    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case axis = "Axis"
        case textAligment = "TextAligment"
    }
    
    public let value: String?
    public let axis: String?
    public let textAligment: String?

    public init(value: String?, axis: String?, textAligment: String?) {
        self.value = value
        self.axis = axis
        self.textAligment = textAligment
    }
}
