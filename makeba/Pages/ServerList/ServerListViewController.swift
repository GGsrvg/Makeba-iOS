//
//  ServerListViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class ServerListViewController: BaseViewController<ServerListView, ServerListViewModel, AddServerInitViewController> {
    
    lazy var refreshControl = UIRefreshControl()
    
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
        self.updateData()
    }
    
    func setup() {
        viewModel.servers.subscribe({ event in
            switch event {
            case .next(_):
                self.refreshControl.endRefreshing()
                self.contentView.tableView.reloadData()
            case .error(_):
                break
            case .completed:
                break
            }
            }).disposed(by: disposeBag)
    }
    
    func updateData() {
        viewModel.loadData()
    }
    
    private func setupNavigationItem() {
        self.navigationItem.title = R.string.localization.servers()
        self.navigationItem.setRightBarButton(addServerBarButton, animated: true)
    }
    
    private func setupView() {
        refreshControl.addTarget(self, action: #selector(valueChangedAction(_:)), for: .valueChanged)
        
        contentView.tableView.register(ServerInfoTableViewCell.self, forCellReuseIdentifier: "\(ServerInfoTableViewCell.self)")
        contentView.tableView.delegate    = self
        contentView.tableView.dataSource  = self
        contentView.tableView.refreshControl = self.refreshControl
    }
    
    @objc private func valueChangedAction(_ sender: UIRefreshControl) {
        self.updateData()
    }
    
    @objc private func goToAddServer() {
        AddServerViewController.openIfCan(from: self, widthData: nil)
    }
}

extension ServerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.servers.value.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
        let server = viewModel.servers.value[indexPath.row]
        cell.setupData(title: server.name, host: server.path, isOnline: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = StatsViewController()
        vc.viewModel.server = viewModel.servers.value[indexPath.row]
        show(vc, sender: nil)
    }
    
    // MARK: - Swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let changeAction = UIContextualAction(style: .normal, title: "Change") { (action, view, success) in
//            success(false)
        }
        changeAction.backgroundColor = .systemOrange
        let removeAction = UIContextualAction(style: .normal, title: "Remove") { (action, view, success) in
            let alert = UIAlertController(title: "Delete Server", message: nil, preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                self.viewModel.removeByIndex(indexPath.row)
                success(true)
            })
            let noAction = UIAlertAction(title: "No", style: .cancel, handler: { action in success(false) })
            alert.addAction(yesAction)
            alert.addAction(noAction)
            self.present(alert, animated: true, completion: nil)
        }
        removeAction.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [removeAction, changeAction])
    }
}
