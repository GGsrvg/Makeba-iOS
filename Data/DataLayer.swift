//
//  DataLayer.swift
//  DataLayer
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

public final class DataLayer {
    private let preference: Preference = Preference()
    private let request: Requests = Requests()
    private let coreData: CoreDataStack = CoreDataStack()
    
    public let server: ServerCase
    public let stat: StatCase
    
    public init() {
        server = ServerCase(coreDataStack: self.coreData, network: request)
        stat = StatCase(coreDataStack: self.coreData, network: request)
    }
}
