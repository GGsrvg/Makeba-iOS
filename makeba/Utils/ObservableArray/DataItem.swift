//
//  DataItem.swift
//  makeba
//
//  Created by GGsrvg on 28.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

class SectionItem<H, R, F> {
    var header: H
    var rows: [R]
    var footer: F
    
    init(header: H, rows: [R], footer: F) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}
