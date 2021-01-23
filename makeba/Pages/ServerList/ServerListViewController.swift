//
//  ServerListViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import Data
import DataModels
import RxSwift
import LDS

class ServerListViewController: BaseViewController<ServerListView, ServerListViewModel, AddServerInitViewController> {
    
    var tableViewAdapter: UITableViewAdapter<String, Server, String>! = nil
    
    lazy var refreshControl = UIRefreshControl()
    
    lazy var addServerBarButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.frame.size = .init(width: 30, height: 30)
        button.addTarget(self, action: #selector(addServerAction), for: .touchUpInside)
        let barButton: UIBarButtonItem = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAdapter = UITableViewAdapter(self.contentView.tableView, observableArray: self.viewModel.servers)
        setupNavigationItem()
        setupView()
        setup()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setup() {
        tableViewAdapter.cellForRow = { [weak self] tableView, indexPath in
            guard let self = self else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
            let row = self.viewModel.servers.array[indexPath.section].rows[indexPath.row]
            cell.setupData(title: row.name, host: row.path, isOnline: true)
            return cell
        }
        tableViewAdapter.titleForHeaderSection = { [weak self] tableView, section in
            guard let self = self else { return nil }
            let header = self.viewModel.servers.array[section].header
            return header
        }
        tableViewAdapter.titleForFooterSection = { [weak self] tableView, section in
            guard let self = self else { return nil }
            let footer = self.viewModel.servers.array[section].footer
            return footer
        }
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
        contentView.tableView.delegate          = self
        contentView.tableView.dataSource        = tableViewAdapter
        contentView.tableView.refreshControl    = self.refreshControl
    }
    
    private func goToAddServer(indexPath: IndexPath? = nil) {
        let data: AddServerInitViewController?
        
        if let indexPath = indexPath {
            let server = self.viewModel.servers.array[indexPath.section].rows[indexPath.row]
            data = .init(server: server, addComplete: nil, updateComplete: nil)
        } else {
            data = nil
        }
        
        let vc = AddServerViewController.openIfCan(widthData: data)
        show(vc, sender: nil)
    }
    
    
    @objc private func valueChangedAction(_ sender: UIRefreshControl) {
        self.updateData()
    }
    
    @objc private func addServerAction() {
        self.goToAddServer()
    }
}

extension ServerListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = StatsViewController()
        vc.viewModel.server = viewModel.servers.array[indexPath.section].rows[indexPath.row]
        show(vc, sender: nil)
    }

    // MARK: - Swipe actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let changeAction = UIContextualAction(style: .normal, title: "Change") { (action, view, success) in
            self.goToAddServer(indexPath: indexPath)
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
