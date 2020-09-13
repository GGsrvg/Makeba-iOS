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
        self.navigationItem.title = _viewModel.server?.name
        configurateView()
        configurateBinding()
        _viewModel.loadData()
    }
    
    private func configurateView() {
        _view.tableView.register(ServerInfoTableViewCell.self, forCellReuseIdentifier: "\(ServerInfoTableViewCell.self)")
        _view.tableView.delegate    = self
        _view.tableView.dataSource  = self
    }
    
    private func configurateBinding() {
        _viewModel.containers.subscribe({ event in
            switch event {
            case .next(_):
                self._view.tableView.reloadData()
            case .error(_):
                break
            case .completed:
                break
            }
        }).disposed(by: disposeBag)
    }
}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return  _viewModel.containers.value.count //(try? _viewModel.statsObservable.value().count) ??
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.containers.value[section].stats?.count ?? 0 // (try? _viewModel.statsObservable.value()[section].stats?.count) ??
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _viewModel.containers.value[section].title // (try? _viewModel.statsObservable.value()[section].title) ??
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ServerInfoTableViewCell.self)", for: indexPath) as! ServerInfoTableViewCell
        //        let data = try! _viewModel.statsObservable.value()[indexPath.section].stats?[indexPath.row]
        if let data =  _viewModel.containers.value[indexPath.section].stats?[indexPath.row] {
            cell.setupData(title: data.title ?? "", host: "", description: data.model?.text ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
