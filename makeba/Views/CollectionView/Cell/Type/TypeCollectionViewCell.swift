//
//  TypeCollectionViewCell.swift
//  makeba
//
//  Created by GGsrvg on 15.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var typeColor: UIView! { didSet {
        typeColor.layer.cornerRadius = 4
    }}
    
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
