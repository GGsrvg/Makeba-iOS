//
//  ServerInfoTableViewCell.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class ServerInfoTableViewCell: UITableViewCell {
    // MARK: - UI Elements
    /*
     -----------------------------
     -labelTitle------------------
     -labelDescription-labelState-
     -----------------------------
     */
    let labelTitle: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelHost: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelState: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .right
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
        addSubview(labelHost)
        addSubview(labelState)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            self.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: 16),
            
            
            labelHost.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelHost.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            self.bottomAnchor.constraint(equalTo: labelHost.bottomAnchor, constant: 14),
            
            labelState.leadingAnchor.constraint(equalTo: labelHost.trailingAnchor, constant: 16),
            
            labelState.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            self.trailingAnchor.constraint(equalTo: labelState.trailingAnchor, constant: 16),
            self.bottomAnchor.constraint(equalTo: labelState.bottomAnchor, constant: 14),
            
            labelState.widthAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    // MARK: - setup data
    func setupData(title: String?, host: String?, isOnline: Bool){
        labelTitle.text = title
        labelHost.text  = host
        labelState.text = isOnline ? "online" : "offline"
    }
}
