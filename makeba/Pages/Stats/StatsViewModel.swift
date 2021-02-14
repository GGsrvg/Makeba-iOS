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
                        
                        self.contentState.accept(.error(error))
                        
                        guard let cError = error as? CError else {
                            return
                        }
                        
                        switch cError.statusCode {
                        case .unauthorized:
                            self.alert.accept(.default(title: "Error", message: "hui"))
                        default:
                            break
                        }
                    }
                }).disposed(by: disposeBag)
        }
    }
}
