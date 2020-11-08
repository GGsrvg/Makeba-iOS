//
//  ObservableDataSourceDelegate.swift
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
    
    func addCell(observableArray: ObservableArrayProtocol, section: Int)
    func insertCell(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func updateCell(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func removeCell(observableArray: ObservableArrayProtocol, section: Int, at index: Int)
    func clearCells(observableArray: ObservableArrayProtocol, section: Int, count: Int)
}
