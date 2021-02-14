//
//  Color.swift
//  Data
//
//  Created by GGsrvg on 09.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

public struct Color: Codable {
    public let red:     CGFloat
    public let green:   CGFloat
    public let blue:    CGFloat

    enum CodingKeys: String, CodingKey {
        case red    = "Red"
        case green  = "Green"
        case blue   = "Blue"
    }

    public init(red: CGFloat?, green: CGFloat?, blue: CGFloat?) {
        self.red    = red ?? 0
        self.green  = green ?? 0
        self.blue   = blue ?? 0
    }
    
    public func convertToUIColor() -> UIColor {
        return UIColor(red: self.red / 255,
                       green: self.green / 255,
                       blue: self.blue / 255,
                       alpha: 1)
    }
}
