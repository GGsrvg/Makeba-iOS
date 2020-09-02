//
//  AddServerViewModel.swift
//  makeba
//
//  Created by GGsrvg on 03.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxRelay

class AddServerViewModel: BaseViewModel {
    let hostPath = BehaviorRelay<String?>(value: nil)
    let hostName = BehaviorRelay<String?>(value: nil)
    let hostDescription = BehaviorRelay<String?>(value: nil)
    
    required init() {
        super.init()
    }
    
    func save() {
        print("====================================")
        print("Host")
        print("path: \(hostPath.value ?? "nil")")
        print("name: \(hostName.value ?? "nil")")
        print("description: \(hostDescription.value ?? "nil")")
        print("====================================")
    }
    
}
