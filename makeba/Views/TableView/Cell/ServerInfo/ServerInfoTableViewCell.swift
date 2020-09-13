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
     -------------------------
     -labelTitle----labelHost-
     -labelDescription       -
     -------------------------
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
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let labelDescription: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
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
        addSubview(labelDescription)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            
            labelHost.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            self.trailingAnchor.constraint(equalTo: labelHost.trailingAnchor, constant: 16),
            
            labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.trailingAnchor.constraint(equalTo: labelDescription.trailingAnchor, constant: 16),
            self.bottomAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 14),
            
            labelHost.leadingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: 6),
            labelDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 6),
        ])
    }
    
    // MARK: - setup data
    func setupData(title: String, host: String, description: String?){
        let emptyString = "-"
        labelTitle.text         = title.isEmpty ? emptyString : title
        labelHost.text          = host.isEmpty ? emptyString : host
        labelDescription.text   = (description ?? "").isEmpty ? emptyString : description
    }
}
