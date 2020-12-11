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
        case diagram = "Diagram"
    }
    
    public let title: String?
    public let text: Text?
    public let diagram: Diagram?
    
    public init(title: String?, text: Text?, diagram: Diagram?) {
        self.title = title
        self.text = text
        self.diagram = diagram
    }
}
