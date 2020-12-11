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
        titleLabel.text = "TEST"
        
        diagramCircle.addItem(.init(text: "C++",     color: .systemYellow,   numberVotes: 10))
//        diagramCircle.addItem(.init(text: "C++",     color: .systemRed,   numberVotes: 10))
//        diagramCircle.addItem(.init(text: "C++",     color: .systemRed,   numberVotes: 10))
//        diagramCircle.addItem(.init(text: "C++",     color: .systemRed,   numberVotes: 10))
        diagramCircle.addItem(.init(text: "C",       color: .systemGreen,    numberVotes: 40))
        diagramCircle.addItem(.init(text: "C#",      color: .systemOrange,   numberVotes: 30))
        diagramCircle.addItem(.init(text: "Java",    color: .systemPurple,   numberVotes: 20))
        diagramCircle.addItem(.init(text: "Swift",   color: .systemPink,     numberVotes: 20))
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(){
    }
}
