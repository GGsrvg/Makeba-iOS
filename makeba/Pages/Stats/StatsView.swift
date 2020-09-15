//
//  StatsView.swift
//  makeba
//
//  Created by GGsrvg on 08.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class StatsView: UIView {
    // MARK: - UI Elements
    // TODO: - add plcaholder(empty list) -
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // MARK: -
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(tableView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
        ])
    }
}
