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
                single(.error(CError.urlNotCorrect))
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
                    single(.error(CError.failedConvert(to: HTTPURLResponse.self)))
                    return
                }
                
                guard let data = data else {
                    single(.error(CError.objectDataNil))
                    return
                }
            
                let statsResponseOrNil = try? JSONDecoder().decode(ContainerResponse<StatsResponse>.self, from: data)
                guard let statsResponse = statsResponseOrNil else {
                    single(.error(CError.failedConvert(to: ContainerResponse<StatsResponse>.self)))
                    return
                }
                
                let responseModel = NetworkResponse(
                    statusCode: response.statusCode,
                    container: statsResponse
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
                single(.error(CError.urlNotCorrect))
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
                    single(.error(CError.failedConvert(to: HTTPURLResponse.self)))
                    return
                }
                
                guard let data = data else {
                    single(.error(CError.objectDataNil))
                    return
                }
            
                let statsResponseOrNil = try? JSONDecoder().decode(ContainerResponse<AuthorizeResponse>.self, from: data)
                guard let statsResponse = statsResponseOrNil else {
                    single(.error(CError.failedConvert(to: ContainerResponse<AuthorizeResponse>.self)))
                    return
                }
                
                let responseModel = NetworkResponse(
                    statusCode: response.statusCode,
                    container: statsResponse
                )
                
                single(.success(responseModel))
            }
            task.resume()
            
            return Disposables.create()
        })
    }
}
