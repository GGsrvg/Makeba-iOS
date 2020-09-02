//
//  ServerListViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class ServerListViewController: BaseViewController<ServerListView, ServerListViewModel> {
    
    private let diseposeBag = DisposeBag()
    
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
        setup()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _viewModel.loadData()
    }
    
    func setup() {
        _viewModel.servers.subscribe({ event in
            switch event {
            case .next(_):
                self._view.tableView.reloadData()
            case .error(_):
                break
            case .completed:
                break
            }
            }).disposed(by: diseposeBag)
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
        let count = try? _viewModel.servers.value().count
        return count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
        if let server = try? _viewModel.servers.value()[indexPath.row] {
            cell.setupData(title: server.name, host: server.path, description: server.description)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        show(StatsViewController(), sender: nil)
    }
}
