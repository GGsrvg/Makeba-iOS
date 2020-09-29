//
//  Stat.swift
//  Data
//
//  Created by GGsrvg on 28.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Stat: Codable {
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case title = "Title"
        case model = "Model"
    }
    
    public let type: String?
    public let title: String?
    public let model: Model?
    
    public init(type: String?, title: String?, model: Model?) {
        self.type = type
        self.title = title
        self.model = model
    }
}
