//
//  ErrorHandler.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

final class ErrorHandler {
    
    func handle(failInfo: FailureInfo, handler: @escaping (ErrorType) -> Void) {
        if let resp = failInfo.response as? HTTPURLResponse {
            DispatchQueue.main.async {
                handler(.server(statusCode: resp.statusCode, data: failInfo.data))
            }
        }
        if failInfo.error != nil {
            DispatchQueue.main.async {
                handler(.network)
            }
        }
    }
    
    func handleGen<T>(failInfo: FailureInfo, handler: @escaping (Result<T, ErrorType>) -> Void) {
        if let resp = failInfo.response as? HTTPURLResponse {
            DispatchQueue.main.async {
                handler(Result.error(.server(statusCode: resp.statusCode, data: failInfo.data)))
            }
        }
        if failInfo.error != nil {
            DispatchQueue.main.async {
                handler(Result.error(.network))
            }
        }
    }
}
