//
//  HTTPResponse.swift
//  Data
//
//  Created by GGsrvg on 07.09.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation


class HTTPResponse<D>: HTTPURLResponse {
    init?(response: HTTPURLResponse, data: D) {
        guard let url = response.url else { return nil }
        guard let headersFields = response.allHeaderFields as? [String : String] else { return nil }
        
        self.data = data
        super.init(url: url, statusCode: response.statusCode, httpVersion: "HTTP/1.1", headerFields: headersFields)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let data: D
}
