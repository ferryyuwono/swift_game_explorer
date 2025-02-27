//
//  NetworkService.swift
//  DataCommon
//
//  Created by Ferry Yuwono on 25/02/25.
//

import Foundation
import Alamofire

@globalActor public actor NetworkService: GlobalActor {
    public static let shared = NetworkService()
    private init() {}
    
    public func get(
        url: String,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil
    ) async throws -> Data? {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                parameters: parameters,
                headers: headers
            )
            .responseData { response in
                switch(response.result) {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
