//
//  DiagramTableViewCell.swift
//  makeba
//
//  Created by GGsrvg on 07.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class DiagramTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var diagramCircle: DiagramCircleView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(){
    }
}
