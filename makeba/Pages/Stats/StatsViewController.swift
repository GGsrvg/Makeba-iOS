//
//  StatsViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit
import RxSwift

class StatsViewController: BaseViewController<StatsView, StatsViewModel, AddServerInitViewController> {
    
    fileprivate var disposables: [Disposable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.server?.name
        configurateView()
        configurateBinding()
        viewModel.loadData()
    }
    
    private func configurateView() {
        contentView.tableView.register(StatTableViewCell.self, forCellReuseIdentifier: "\(StatTableViewCell.self)")
        contentView.tableView.register(UINib(nibName: "\(DiagramTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(DiagramTableViewCell.self)")
        contentView.tableView.delegate    = self
        contentView.tableView.dataSource  = self
    }
    
    private func configurateBinding() {
        viewModel.containers.subscribe({ [weak self] event in
            switch event {
            case .next(_):
                self?.contentView.tableView.reloadData()
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
        return  viewModel.containers.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.containers.value[section].stats.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.containers.value[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.containers.value[indexPath.section].stats[indexPath.row]
        let cell: UITableViewCell
            
        if let text = data.text {
            let statCell = tableView.dequeueReusableCell(withIdentifier: "\(StatTableViewCell.self)", for: indexPath) as! StatTableViewCell
            statCell.setupData(title: data.title, value: text.value)
            cell = statCell
        } else if let _ = data.diagram {
            let diagramCell = tableView.dequeueReusableCell(withIdentifier: "\(DiagramTableViewCell.self)", for: indexPath) as! DiagramTableViewCell
            diagramCell.setupData()
            cell = diagramCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.largeContentTitle = "No support this type"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
