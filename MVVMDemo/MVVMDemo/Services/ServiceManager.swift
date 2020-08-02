//
//  ServiceManager.swift
//  MVVMDemo
//
//  Created by Shitesh Patel on 26/07/20.
//  Copyright © 2020 Shitesh Patel. All rights reserved.
//

import Foundation

struct ServiceManager {
    func getAPIData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            
            if error == nil && responseData != nil && responseData?.count != 0 {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("getting eoor while decoding: \(error.localizedDescription)")
                    completionHandler(nil)
                }
            } else {
                completionHandler(nil)
            }
        }.resume()
    }

    func postAPIData<T: Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in
//            debugPrint("httpUrlResponse: \(String(describing: httpUrlResponse))")
//            debugPrint("error: \(String(describing: error?.localizedDescription))")
            if error == nil && responseData != nil {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                } catch let error {
                    debugPrint("getting error while decoding: \(error.localizedDescription)")
                }
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
}
