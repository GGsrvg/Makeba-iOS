//
//  StatTableViewCell.swift
//  makeba
//
//  Created by GGsrvg on 22.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class StatTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    /*
     -----------------------------
     -labelTitle------------------
     -labelValue------------------
     -----------------------------
     */
    let labelTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelValue: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        addSubview(labelTitle)
        addSubview(labelValue)
        setupLayout()
    }
    
    private func setupLayout() {
        let hMargin: CGFloat = 16
        let vMargin: CGFloat = 14
        let spacing: CGFloat = 10
        
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hMargin),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: vMargin),
            self.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: hMargin),
            
            
            labelValue.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: hMargin),
            labelValue.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: spacing),
            self.trailingAnchor.constraint(equalTo: labelValue.trailingAnchor, constant: hMargin),
            self.bottomAnchor.constraint(equalTo: labelValue.bottomAnchor, constant: vMargin),
        ])
    }
    
    // MARK: - setup data
    func setupData(title: String?, value: String?){
        labelTitle.text = title
        labelValue.text = value
    }
}
