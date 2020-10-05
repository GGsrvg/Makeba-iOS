//
//  AddServerViewModel.swift
//  makeba
//
//  Created by GGsrvg on 03.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data
import RxRelay
import RxSwift

class AddServerViewModel: BaseViewModel {
    let hostPath = BehaviorRelay<String?>(value: nil)
    let hostName = BehaviorRelay<String?>(value: nil)
    
    required init() {
        super.init()
    }
    
    func save() {
        func emptyFieldAlert(message: String) {
            self.alert.accept(.default(title: "Error", message: message))
        }
        
        guard let hostPath = hostPath.value, !hostPath.isEmpty, hostPath.count >= 7 else { return emptyFieldAlert(message: "Host path field is no correct") }
        guard let hostName = hostName.value, !hostName.isEmpty else { return emptyFieldAlert(message: "Host name is empty") }
        
        data?.server.save(.init(name: hostName, path: hostPath, dateCreated: .init()))
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success:
                    self.isNeedClosed.accept(true)
                case .error(let error):
                    if let queryError = error as? DError {
                        self.alert.accept(.default(title: "Error", message: queryError.localizedDescription))
                    }
                }
            }).disposed(by: disposeBag)
    }
    
}
