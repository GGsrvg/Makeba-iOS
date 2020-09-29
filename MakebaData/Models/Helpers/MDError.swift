//
//  MDError.swift
//  MakebaData
//
//  Created by GGsrvg on 29.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data

public class MDError: DError {
    public let typeError: TypeError
    
    public let message: String
    
    internal init(typeError: TypeError, message: String) {
        self.typeError = typeError
        self.message = message
    }
}
