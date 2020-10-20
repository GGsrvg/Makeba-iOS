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
        case title = "Title"
        case text = "Text"
    }
    
    public let title: String?
    public let text: Text?
    
    public init(title: String?, model: Text?) {
        self.title = title
        self.text = model
    }
}
