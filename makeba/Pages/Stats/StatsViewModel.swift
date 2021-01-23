//
//  StatsViewModel.swift
//  makeba
//
//  Created by GGsrvg on 08.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift
import Data
import DataModels

class StatsViewModel: BaseViewModel {
    
    var containers: BehaviorRelay<[Stats]> = .init(value: [])
    weak var server: Server? = nil
    
    required init() {
        super.init()
    }
    
    override func retryLoad() {
        self.loadData()
    }
    
    func loadData() {
        if let server = self.server {
            data?.stat.get(server: server)
                .subscribeOn(SerialDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe({ single in
                    switch single {
                    case .success(let data):
                        self.containers.accept(data)
                        self.contentState.accept(.content)
                    case .error(let error):
                        if let queryError = error as? DError {
                            self.alert.accept(.default(title: "Error", message: queryError.localizedDescription))
                            self.contentState.accept(.dataEmpty)
                        }
                    }
                }).disposed(by: disposeBag)
        }
    }
}
