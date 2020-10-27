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
    // if nil need save else update
    weak var server: Server? = nil {
        didSet {
            if let server = server {
                self.hostName.accept(server.name)
                self.hostPath.accept(server.path)
            }
        }
    }
    
    let hostPath = BehaviorRelay<String?>(value: nil)
    let hostName = BehaviorRelay<String?>(value: nil)
    
    required init() {
        super.init()
        self.contentState.accept(.content)
    }
    
    func save() {
        func emptyFieldAlert(message: String) {
            self.alert.accept(.default(title: "Error", message: message))
        }
        guard let data = self.data else { return emptyFieldAlert(message: "DataLayer is nil") }
        guard let hostPath = hostPath.value, !hostPath.isEmpty else { return emptyFieldAlert(message: "Host path is empty") }
        guard let hostName = hostName.value, !hostName.isEmpty else { return emptyFieldAlert(message: "Host name is empty") }
        
        let request: Single<Bool>
            
        if let server = self.server {
            request = data.server.update(.init(name: hostName, path: server.path, dateCreated: server.dateCreated))
        } else {
            request = data.server.save(.init(name: hostName, path: hostPath, dateCreated: .init()))
        }
            
        request
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
