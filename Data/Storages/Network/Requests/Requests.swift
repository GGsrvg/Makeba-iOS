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
    func stats(server: Server) -> Single<HTTPResponse<[StatsContainerResponse]>> {
        return .create(subscribe: { single in
            let url = URL(string: server.path)!

            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else {
                    
                    return
                }
                if let array: [StatsContainerResponse] = try? JSONDecoder().decode([StatsContainerResponse].self, from: data) {
                    if let httpResponse = HTTPResponse(response: response as! HTTPURLResponse, data: array) {
                        single(.success(httpResponse))
                    }
                }
                single(.error(NSError(domain: "self", code: 0, userInfo: nil)))
            }

            task.resume()
            return Disposables.create()
        })
    }
}
