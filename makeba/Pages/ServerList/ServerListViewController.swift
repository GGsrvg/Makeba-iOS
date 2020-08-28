//
//  ServerListViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class ServerListViewController: BaseViewController<ServerListView, ServerListViewModel> {
    
    lazy var addServerBarButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.frame.size = .init(width: 30, height: 30)
        button.addTarget(self, action: #selector(goToAddServer), for: .touchUpInside)
        let barButton: UIBarButtonItem = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupView()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = R.string.localization.servers()
        self.navigationItem.setRightBarButton(addServerBarButton, animated: true)
    }
    
    private func setupView() {
        _view.tableView.register(ServerInfoTableViewCell.self, forCellReuseIdentifier: "\(ServerInfoTableViewCell.self)")
        _view.tableView.delegate    = self
        _view.tableView.dataSource  = self
    }
    
    @objc private func goToAddServer() {
        show(AddServerViewController(), sender: nil)
    }
}

extension ServerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
        cell.setupData(title: "The Base #\(indexPath.row)", host: "66.60.06.66", description: "The Very Good")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        show(StatsViewController(), sender: nil)
    }
}
