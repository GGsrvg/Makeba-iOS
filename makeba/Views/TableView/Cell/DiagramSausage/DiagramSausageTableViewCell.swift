//
//  DiagramSausageTableViewCell.swift
//  makeba
//
//  Created by GGsrvg on 13.02.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import UIKit

class DiagramSausageTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var diagramSausage: DiagramSausageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
