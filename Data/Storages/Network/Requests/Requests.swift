//
//  Requests.swift
//  Data
//
//  Created by GGsrvg on 28.08.2020.
//  Copyright © 2020 GGsrvg. All rights reserved.
//

import Foundation
import RxSwift

final class Requests {
    func stats(server: Server) -> Single<NetworkResponse<[StatsContainerResponse]?>> {
        return .create(subscribe: { single in
            if let url = URL(string: server.path) {
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    if let data = data {
                        // parse json
                        if let array: [StatsContainerResponse] = try? JSONDecoder().decode([StatsContainerResponse].self, from: data) {
                            if let httpResponse = NetworkResponse<[StatsContainerResponse]?>(response: response as! HTTPURLResponse, data: array) {
                                single(.success(httpResponse))
                            } else {
                                single(.error(NetworkError(type: .custom, message: "NetworkResponse return nil")))
                            }
                        } else {
                            single(.error(NetworkError(type: .jsonNotCorrect)))
                        }
                    } else {
                        if let response = response {
                            if let networkResponse = NetworkResponse<[StatsContainerResponse]?>(response: response as! HTTPURLResponse, data: nil) {
                                single(.success(networkResponse))
                            }
                        } else if let error = error {
                            single(.error(error))
                        } else {
                            single(.error(NetworkError(type: .custom, message: "")))
                        }
                    }
                }
                task.resume()
            } else {
                single(.error(NetworkError(type: .url)))
            }
            return Disposables.create()
        })
    }
}
