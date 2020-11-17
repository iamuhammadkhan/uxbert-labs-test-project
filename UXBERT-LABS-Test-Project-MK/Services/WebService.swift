//
//  WebService.swift
//  UXBERT-LABS-Test-Project-MK
//
//  Created by Muhammad Khan on 01/11/2020.
//  Copyright © 2020 Muhammad Khan. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod
    let parse: (Data) -> T?
    var body: Data? = nil
}

final class WebService {
    class func loadData<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
