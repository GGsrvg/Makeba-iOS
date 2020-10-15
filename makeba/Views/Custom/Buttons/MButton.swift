//
//  MButton.swift
//  makeba
//
//  Created by GGsrvg on 15.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class MButton: UIButton {
    
    convenience init() {
        self.init(type: .system)
        setView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    private func setView() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.adjustsImageSizeForAccessibilityContentSizeCategory = true
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.contentEdgeInsets = .init(top: 10, left: 14, bottom: 10, right: 14)
        
        self.backgroundColor = .systemBlue
        self.setTitleColor(.white, for: .normal)
    }
}
