//
//  Responses.swift
//  Data
//
//  Created by GGsrvg on 06.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

// MARK: - StatsContainerElement
struct StatsContainerResponse: Codable {
    let title: String?
    let stats: [StatResponse]?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case stats = "Stats"
    }
}

// MARK: - Stat
struct StatResponse: Codable {
    let type: String?
    let title: String?
    let model: ModelReponse?

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Title"
        case model = "Model"
    }
}

// MARK: - Model
struct ModelReponse: Codable {
    let text: String?
    let axis: String?
    let textAligment: String?

    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case axis = "Axis"
        case textAligment = "TextAligment"
    }
}
