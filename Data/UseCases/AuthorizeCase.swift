//
//  AuthorizeCase.swift
//  Data
//
//  Created by GGsrvg on 21.01.2021.
//  Copyright © 2021 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import API

public class AuthorizeCase: BaseCase {
    
    private weak var api: Requests!
    
    init(api: Requests) {
        self.api = api
    }
    
    public func authorize(login: String, password: String) -> Single<String> {
        return .create(subscribe: { _ in
            return Disposables.create()
        })
    }
}
