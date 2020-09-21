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
    func stats(server: Server) -> Single<NetworkResponse<StatsResponse?>> {
        return .create(subscribe: { single in
            guard let url = URL(string: server.path) else {
                single(.error(NetworkError(type: .url)))
                return Disposables.create()
            }
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let error = error {
                    single(.error(error))
                    return
                }
                
                guard let response = response as? HTTPURLResponse else {
                    return single(.error(NetworkError(type: .convertToHTTPURLResponse)))
                }
                
                if response.statusCode == StatusCode.ok.rawValue {
                    if let data = data {
                        if let array: StatsResponse = try? JSONDecoder().decode(StatsResponse.self, from: data) {
                            single(.success(NetworkResponse<StatsResponse?>(response: response, data: array)!))
                        }
                    }
                }
                
                single(.success(NetworkResponse<StatsResponse?>(response: response, data: nil)!))
            }
            task.resume()
            
            return Disposables.create()
        })
    }
}
