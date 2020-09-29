//
//  Server.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Server {
    public let name: String
    public let path: String
    public let dateCreated: Date
    
    public init(name: String, path: String, dateCreated: Date) {
        self.name = name
        self.path = path
        self.dateCreated = dateCreated
    }
}
