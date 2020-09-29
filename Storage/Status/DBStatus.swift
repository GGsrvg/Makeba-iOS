//
//  DBStatus.swift
//  Data
//
//  Created by GGsrvg on 02.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import CoreData

public class DBStatus<D> {
    
    public let isSuccessfullyCompleted: Bool
    public let message: String
    public let data: D
    
    internal init(isSuccessfullyCompleted: Bool, message: String, data: D) {
        self.isSuccessfullyCompleted = isSuccessfullyCompleted
        self.message = message
        self.data = data
    }
    
    internal init(data: D) {
        self.isSuccessfullyCompleted = true
        self.message = ""
        self.data = data
    }
}
