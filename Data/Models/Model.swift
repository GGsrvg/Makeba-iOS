//
//  Model.swift
//  Data
//
//  Created by GGsrvg on 28.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Model: Codable {
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case axis = "Axis"
        case textAligment = "TextAligment"
    }
    
    public let text: String?
    public let axis: String?
    public let textAligment: String?

    public init(text: String?, axis: String?, textAligment: String?) {
        self.text = text
        self.axis = axis
        self.textAligment = textAligment
    }
}
