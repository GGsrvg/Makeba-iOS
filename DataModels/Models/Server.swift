//
//  Server.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public class Server {
    public var name: String
    public let path: String
    public let dateCreated: Date
    
    public init(name: String, path: String, dateCreated: Date) {
        self.name = name
        self.path = path
        self.dateCreated = dateCreated
    }
}

extension Server : Hashable {
    public static func == (lhs: Server, rhs: Server) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(path)
        hasher.combine(name)
        hasher.combine(dateCreated)
    }
}
