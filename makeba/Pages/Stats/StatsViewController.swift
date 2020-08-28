//
//  StatsViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class StatsViewController: BaseViewController<StatsView, StatsViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateView()
        configurateBinding()
    }
    
    private func configurateView() {
        _view.tableView.register(ServerInfoTableViewCell.self, forCellReuseIdentifier: "\(ServerInfoTableViewCell.self)")
        _view.tableView.delegate    = self
        _view.tableView.dataSource  = self
    }
    
    private func configurateBinding() {
//        let _ = _viewModel.statsObservable.subscribe {
//            switch $0 {
//            case .next(_):
//                self._view.tableView.reloadData()
//            default:
//                break
//            }
//        }
    }
}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  0 //(try? _viewModel.statsObservable.value().count) ??
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 // (try? _viewModel.statsObservable.value()[section].stats?.count) ??
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "---" // (try? _viewModel.statsObservable.value()[section].title) ??
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
//        let data = try! _viewModel.statsObservable.value()[indexPath.section].stats?[indexPath.row]
        cell.setupData(title: "", host: "", description: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
