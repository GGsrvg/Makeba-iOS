//
//  Requests.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift
import DataModels

public class Requests {
    public init() {}
    
    public func stats(server: Server) -> Single<NetworkResponse<StatsResponse>> {
        return .create(subscribe: { single in
            // check url path
            guard let url = URL(string: server.path) else {
                single(.error(NetworkError(type: .url)))
                return Disposables.create()
            }
            
            // create url request
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                // if `error` not nil then return it
                if let error = error {
                    single(.error(NetworkError(message: error.localizedDescription)))
                    return
                }
                
                // if `response` it is not HTTPURLResponse type
                // then return error about it
                guard let response = response as? HTTPURLResponse else {
                    return single(.error(NetworkError(type: .convertToHTTPURLResponse)))
                }
                
                // validate status code
                switch response.statusCode {
                // 200
                case StatusCode.ok.rawValue:
                    if let data = data,
                       let statsResponse = try? JSONDecoder().decode(StatsResponse.self, from: data),
                       let networkResponse = NetworkResponse(response: response, data: statsResponse) {
                        single(.success(networkResponse))
                    } else {
                        single(.error(NetworkError(type: .unsuccessfulInit)))
                    }
                // 400
                case StatusCode.unauthorized.rawValue:
                    single(.error(NetworkError(type: .unauthorized)))
                default:
                    single(.success(NetworkResponse(response: response, data: nil)!))
                }
            }
            task.resume()
            
            return Disposables.create()
        })
    }
    
    public func authorize(urlPath: String, requestData: AuthorizeRequest) -> Single<NetworkResponse<AuthorizeResponse>> {
        return .create(subscribe: { single in
            // check url path
            guard let url = URL(string: urlPath) else {
                single(.error(NetworkError(type: .url)))
                return Disposables.create()
            }
            
            // create url request
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                // if `error` not nil then return it
                if let error = error {
                    single(.error(NetworkError(message: error.localizedDescription)))
                    return
                }
                
                // if `response` it is not HTTPURLResponse type
                // then return error about it
                guard let response = response as? HTTPURLResponse else {
                    return single(.error(NetworkError(type: .convertToHTTPURLResponse)))
                }
                
                // validate status code
                switch response.statusCode {
                // 200
                case StatusCode.ok.rawValue:
                    if let data = data,
                       let statsResponse = try? JSONDecoder().decode(AuthorizeResponse.self, from: data),
                       let networkResponse = NetworkResponse(response: response, data: statsResponse) {
                        single(.success(networkResponse))
                    } else {
                        single(.error(NetworkError(type: .unsuccessfulInit)))
                    }
                default:
                    single(.success(NetworkResponse(response: response, data: nil)!))
                }
            }
            task.resume()
            
            return Disposables.create()
        })
    }
}
