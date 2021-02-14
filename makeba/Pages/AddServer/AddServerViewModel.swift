//
//  AddServerViewModel.swift
//  makeba
//
//  Created by GGsrvg on 03.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import Data
import DataModels
import RxRelay
import RxSwift

class AddServerViewModel: BaseViewModel {
    // if nil need save else update
    weak var server: Server? = nil
    
    required init() {
        super.init()
        self.contentState.accept(.content)
    }
    
    func save(hostPath: String?, hostName: String?) {
        func emptyFieldAlert(message: String) {
            self.alert.accept(.default(title: "Error", message: message))
        }
        guard let data = self.data else { return emptyFieldAlert(message: "DataLayer is nil") }
        guard let hostPath = hostPath, !hostPath.isEmpty else { return emptyFieldAlert(message: "Host path is empty") }
        guard let hostName = hostName, !hostName.isEmpty else { return emptyFieldAlert(message: "Host name is empty") }
        
        let requestOnUpdateOrSave: Single<Bool>
            
        if let server = self.server {
            server.name = hostName
            requestOnUpdateOrSave = data.server.update(server)
        } else {
            requestOnUpdateOrSave = data.server.save(.init(name: hostName, path: hostPath, dateCreated: .init()))
        }
            
        requestOnUpdateOrSave
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success:
                    self.isNeedClosed.accept(true)
                case .error(let error):
                    break
//                    if let queryError = error as? DError {
//                        self.alert.accept(.default(title: "Error", message: queryError.localizedDescription))
//                    }
                }
            }).disposed(by: disposeBag)
    }
    
}
