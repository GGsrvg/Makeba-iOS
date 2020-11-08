//
//  ObservableArrayCallback.swift
//  makeba
//
//  Created by GGsrvg on 23.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation

// u dont need call this methods
protocol ObservableDataSourceDelegate: class {
    func addSection(observableArray: ObservableArrayProtocol)
    func insertSection(observableArray: ObservableArrayProtocol, at index: Int)
    func updateSection(observableArray: ObservableArrayProtocol, at index: Int)
    func removeSection(observableArray: ObservableArrayProtocol, at index: Int)
    func clear(observableArray: ObservableArrayProtocol)
    
    func changeHeader(observableArray: ObservableArrayProtocol, section: Int)
    func changeFooter(observableArray: ObservableArrayProtocol, section: Int)
    
    func addRow(observableArray: ObservableArrayProtocol, section: Int)
    func insertRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func updateRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func removeRow(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func clearRows(observableArray: ObservableArrayProtocol, section: Int, count: Int)
}
