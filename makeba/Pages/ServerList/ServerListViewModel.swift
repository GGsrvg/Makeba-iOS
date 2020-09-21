//
//  ServerListViewModel.swift
//  makeba
//
//  Created by GGsrvg on 02.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift
import Data

class ServerListViewModel: BaseViewModel {

    let servers: BehaviorRelay<[Server]> = .init(value: [])
    
    required init() {
        super.init()
    }
    
    func loadData() {
        data?.server.get()
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success(let data):
                    self.servers.accept(data)
                case .error(_):
                    break
                }
            }).disposed(by: disposeBag)
    }
    
    func removeByIndex(_ i: Int) {
        data?.server.delete(servers.value[i])
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success(let data):
                    if data {
                        var servers = self.servers.value
                        servers.remove(at: i)
                        self.servers.accept(servers)
                    }
                case .error(_):
                    break
                }
            }).disposed(by: disposeBag)
    }
}
