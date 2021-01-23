//
//  AddServerInitViewController.swift
//  makeba
//
//  Created by GGsrvg on 02.10.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import DataModels

struct AddServerInitViewController: BaseInitViewController {
    let server: Server
    let addComplete: (() -> Void)?
    let updateComplete: (() -> Void)?
}
