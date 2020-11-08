//
//  TableViewDataSource.swift
//  makeba
//
//  Created by GGsrvg on 31.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import UIKit

class UITableViewAdapter<H, R, F>: NSObject, UITableViewDataSource {
    
    typealias OA = ObservableDataSource<H, R, F>
    typealias CellForRow = ((UITableView, IndexPath) -> UITableViewCell)
    typealias ViewForSection = ((UITableView, Int) -> String?)
    
    // TODO: need check on leeks
    private let observable: OA
    private let tableView: UITableView
    
    public var cellForRow: CellForRow? = nil
    public var titleForHeaderSection: ViewForSection? = nil
    public var titleForFooterSection: ViewForSection? = nil
    
    init(_ tableView: UITableView, observableArray: OA) {
        self.observable = observableArray
        self.tableView = tableView
        super.init()
        observableArray.addCallback(self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return observable.array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observable.array[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleForHeaderSection?(tableView, section)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.titleForFooterSection?(tableView, section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let action = self.cellForRow else { return UITableViewCell() }
        return action(tableView, indexPath)
    }
}

extension UITableViewAdapter: ObservableDataSourceDelegate {
    func addSection(observableArray: ObservableArrayProtocol) {
        let indexLastSection: Int = observable.array.count - 1
        tableView.insertSections(.init(integer: indexLastSection), with: .automatic)
    }
    
    func insertSection(observableArray: ObservableArrayProtocol, at index: Int) {
        tableView.insertSections(.init(integer: index), with: .automatic)
    }
    
    func updateSection(observableArray: ObservableArrayProtocol, at index: Int) {
        tableView.reloadSections(.init(integer: index), with: .automatic)
    }
    
    func removeSection(observableArray: ObservableArrayProtocol, at index: Int) {
        tableView.deleteSections(.init(integer: index), with: .automatic)
    }
    
    func clear(observableArray: ObservableArrayProtocol) {
        tableView.reloadData()
    }
    
    func changeHeader(observableArray: ObservableArrayProtocol, section: Int) {
        tableView.reloadSections(.init(integer: section), with: .automatic)
    }
    
    func changeFooter(observableArray: ObservableArrayProtocol, section: Int) {
        tableView.reloadSections(.init(integer: section), with: .automatic)
    }
    
    func addRow(observableArray: ObservableArrayProtocol, section: Int) {
        let indexLasrRow = self.observable.array[section].rows.count - 1
//        self.tableView.reloadData()
        self.tableView.insertRows(at: [.init(row: indexLasrRow, section: section)], with: .automatic)
        self.tableView.refreshControl?.endRefreshing()
    }
    
    func insertRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int) {
        self.tableView.insertRows(at: [.init(row: index, section: section)], with: .automatic)
    }
    
    func updateRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int) {
        self.tableView.reloadRows(at: [.init(row: index, section: section)], with: .automatic)
    }
    
    func removeRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int) {
        self.tableView.deleteRows(at: [.init(row: index, section: section)], with: .automatic)
    }
    
    func clearRows(observableArray: ObservableArrayProtocol, section: Int, count: Int) {
        var indexPaths: [IndexPath] = []
        
        for i in 0..<count {
            indexPaths.append(IndexPath(row: i, section: section))
            print("row: \(i), section: \(section)")
        }
        
        self.tableView.deleteRows(at: indexPaths, with: .fade)
    }
}
