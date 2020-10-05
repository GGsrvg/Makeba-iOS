//
//  BaseViewModel.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data
import RxSwift
import RxRelay

class BaseViewModel {
    let disposeBag: DisposeBag = DisposeBag()
    weak var data: DataLayer?
    var isNeedClosed: BehaviorRelay<Bool>! = .init(value: false)
    var alert: BehaviorRelay<Alert>! = .init(value: .none)
    
    required init() {
        guard let data = (UIApplication.shared.delegate as? AppDelegate)?.data else { fatalError("AppDelegate not have Data attribute") }
        self.data = data
    }
    
    deinit {
        print("deinit \(self)")
    }
    
    
}

extension BaseViewModel {
    enum Alert {
        case none
        case `default`(title: String, message: String, successTitle: String = "OK")
    }
}
