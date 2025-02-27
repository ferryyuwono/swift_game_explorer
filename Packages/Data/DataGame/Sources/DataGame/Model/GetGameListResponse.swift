//
//  GetGameListResponse.swift
//  DataGame
//
//  Created by Ferry Yuwono on 25/02/25.
//

public struct GetGameListResponse: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GameData]?
}
