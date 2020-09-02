//
//  StatsViewModel.swift
//  makeba
//
//  Created by GGsrvg on 08.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

class StatsViewModel: BaseViewModel {
    
//    let statsObservable: BehaviorSubject<[StatsContainer]> = .init(value: .init())
    
    required init() {
        super.init()
        loadStats()
    }
    
    private func loadStats() {
//        let _ = network.mainCase.getStats()
//            .observeOn(MainScheduler.instance)
//            .subscribe {
//                switch $0 {
//                case .next(let stats):
//                    self.statsObservable.onNext(stats)
//                    break
//                case .error(_):
//                    break
//                case .completed:
//                    break
//                }
//        }
    }
}
