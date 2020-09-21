//
//  SNStatModel.swift
//  Data
//
//  Created by GGsrvg on 20.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

struct SNStatModel: Codable {
    let text: String?
    let axis: String?
    let textAligment: String?

    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case axis = "Axis"
        case textAligment = "TextAligment"
    }
}
