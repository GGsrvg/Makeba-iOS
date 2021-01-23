//
//  AddServerViewControllerDelegate.swift
//  makeba
//
//  Created by GGsrvg on 14.12.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import DataModels

protocol AddServerViewControllerDelegate: class {
    func addNewServer(_ addServerViewController: AddServerViewControllerDelegate)
    func updateServer(_ addServerViewController: AddServerViewControllerDelegate, server: Server)
}
