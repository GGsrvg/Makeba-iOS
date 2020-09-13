//
//  UIMTextField.swift
//  makeba
//
//  Created by GGsrvg on 02.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class UIMTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var padding: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
