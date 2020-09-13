//
//  Server.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Server {
    public init(name: String, path: String, description: String, dateCreated: Date) {
        self.name = name
        self.path = path
        self.description = description
        self.dateCreated = dateCreated
    }
    
    public let name: String
    public let path: String
    public let description: String
    public let dateCreated: Date
}
