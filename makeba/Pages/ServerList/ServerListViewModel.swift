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
import DataModels
import Data
import LDS

class ServerListViewModel: BaseViewModel {

    let servers: ObservableDataSource<String, Server, String> = ObservableDataSource()
    
    required init() {
        super.init()
        servers.addSection(.init(header: "", rows: [], footer: ""))
        loadData()
        data!.server.objectState
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                switch event {
                case .next(let state):
                    guard let state = state else { return }
                    switch state.status {
                    case .add:
                        self.servers.addRow(state.value, section: 0)
                    case .update:
                        self.servers.updateRow(state.value, section: 0, at: 0) //(state.value, section: 0)
                    case .delete:
                        break
                    //                    self.servers.removeRow(section: 0, at: 0)
                    }
                case .error(_):
                    break
                case .completed:
                    break
                }
            }.disposed(by: self.disposeBag)
    }
    
    override func retryLoad() {
        self.loadData()
    }
    
    func loadData() {
        data?.server.get()
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success(let data):
                    self.servers.clearRow(section: 0)
                    data.forEach {
                        self.servers.addRow($0, section: 0)
                    }
                    self.contentState.accept(data.count == 0 ? .dataEmpty : .content)
                case .error(_):
                    self.contentState.accept(.dataEmpty)
                    break
                }
            }).disposed(by: disposeBag)
    }
    
    func removeByIndex(_ i: Int) {
        data?.server.delete(servers.array[0].rows[i])
            .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe({ single in
                switch single {
                case .success(let data):
                    if data {
                        self.servers.removeRow(section: 0, at: i)
                        let content: VCStates = self.servers.array[0].rows.count == 0 ? .dataEmpty : .content
                        self.contentState.accept(content)
                    }
                case .error(_):
                    self.contentState.accept(.dataEmpty)
                    break
                }
            }).disposed(by: disposeBag)
    }
}
