//
//  GameDataSource.swift
//  DataGame
//
//  Created by Ferry Yuwono on 25/02/25.
//

import Foundation
import Alamofire
private import DataCommon

public struct GameDataSource {
    public func getGameList(
        request: GetGameListRequest
    ) async -> GetGameListResponse? {
        do {
            let encoder = JSONEncoder()
            let requestData = try encoder.encode(request)
            guard let parameter = try JSONSerialization.jsonObject(
                with: requestData
            ) as? Parameters else { return nil }
            guard let data = try await NetworkService.shared.get(
                url: "https://api.rawg.io/api/games",
                parameters: parameter
            ) else { return nil }
            
            let decoder = JSONDecoder()
            return try decoder.decode(GetGameListResponse.self, from: data)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
