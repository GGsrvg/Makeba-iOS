//
//  StatsContainer.swift
//  Data
//
//  Created by GGsrvg on 07.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class StatsContainer {
    public let title: String?
    public let stats: [Stat]?
    
    public init(title: String?, stats: [Stat]?) {
        self.title = title
        self.stats = stats
    }
}

// MARK: - Stat
public class Stat {
    public let type: String?
    public let title: String?
    public let model: Model?
    
    public init(type: String?, title: String?, model: Model?) {
        self.type = type
        self.title = title
        self.model = model
    }
}

// MARK: - Model
public class Model {
    public let text: String?
    public let axis: String?
    public let textAligment: String?

    public init(text: String?, axis: String?, textAligment: String?) {
        self.text = text
        self.axis = axis
        self.textAligment = textAligment
    }
}
