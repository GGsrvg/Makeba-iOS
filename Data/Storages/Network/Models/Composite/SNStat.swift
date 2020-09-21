//
//  SNStat.swift
//  Data
//
//  Created by GGsrvg on 20.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

struct SNStat: Codable {
    let type: String?
    let title: String?
    let model: SNStatModel?

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Title"
        case model = "Model"
    }
}
