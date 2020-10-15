//
//  MLabel.swift
//  makeba
//
//  Created by GGsrvg on 15.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class MLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    private func setView() {
        self.adjustsFontForContentSizeCategory = true
    }
}
