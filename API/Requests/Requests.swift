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

// TODO: need rework
public class Requests {
    public init() {}
    
    public func stats(server: Server) -> Single<NetworkResponse<StatsResponse>> {
        return .create(subscribe: { single in
            // check url path
            guard let url = URL(string: server.path) else {
                single(.error(NetworkError.urlNotCorrect))
                return Disposables.create()
            }
            
            // create url request
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                // if `error` not nil then return it
                if let error = error {
                    single(.error(error))
                    return
                }
                
                // if `response` it is not HTTPURLResponse type
                // then return error about it
                guard let response = response as? HTTPURLResponse else {
                    single(.error(NetworkError.failedConvert(to: HTTPURLResponse.self)))
                    return
                }
                
                guard let data = data else {
                    single(.error(NetworkError.objectDataNil))
                    return
                }
            
                let statsResponseOrNil = try? JSONDecoder().decode(StatsResponse.self, from: data)
                guard let statsResponse = statsResponseOrNil else {
                    single(.error(NetworkError.failedConvert(to: StatsResponse.self)))
                    return
                }
                
                let responseModel = NetworkResponse(
                    statusCode: response.statusCode,
                    data: statsResponse
                )
                
                single(.success(responseModel))
            }
            task.resume()
            
            return Disposables.create()
        })
    }
    
    public func authorize(urlPath: String, requestData: AuthorizeRequest) -> Single<NetworkResponse<AuthorizeResponse>> {
        return .create(subscribe: { single in
            // check url path
            guard let url = URL(string: urlPath) else {
                single(.error(NetworkError.urlNotCorrect))
                return Disposables.create()
            }
            
            // create url request
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                // if `error` not nil then return it
                if let error = error {
                    single(.error(error))
                    return
                }
                
                // if `response` it is not HTTPURLResponse type
                // then return error about it
                guard let response = response as? HTTPURLResponse else {
                    single(.error(NetworkError.failedConvert(to: HTTPURLResponse.self)))
                    return
                }
                
                guard let data = data else {
                    single(.error(NetworkError.objectDataNil))
                    return
                }
            
                let statsResponseOrNil = try? JSONDecoder().decode(AuthorizeResponse.self, from: data)
                guard let statsResponse = statsResponseOrNil else {
                    single(.error(NetworkError.failedConvert(to: AuthorizeResponse.self)))
                    return
                }
                
                let responseModel = NetworkResponse(
                    statusCode: response.statusCode,
                    data: statsResponse
                )
                
                single(.success(responseModel))
            }
            task.resume()
            
            return Disposables.create()
        })
    }
}
