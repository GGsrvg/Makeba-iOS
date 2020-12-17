//
//  ObjectState.swift
//  Data
//
//  Created by GGsrvg on 05.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

public struct ObjectState<T> {
    public enum Status {
        case add
        case update
        case delete
        // need add case for change position
    }
    
    public let status: Status
    public let value: T
    
    public init(status: Status, value: T) {
        self.status = status
        self.value = value
    }
}

// just simple methods
extension ObjectState {
    public static func add(value: T) -> ObjectState {
        return ObjectState(status: .add, value: value)
    }
    
    public static func update(value: T) -> ObjectState {
        return ObjectState(status: .update, value: value)
    }
    
    public static func delete(value: T) -> ObjectState {
        return ObjectState(status: .delete, value: value)
    }
}
