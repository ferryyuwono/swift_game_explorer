//
//  GameData.swift
//  DataGame
//
//  Created by Ferry Yuwono on 25/02/25.
//

struct GameData: Codable {
    let id: Int?
    let name: String?
    let backgroundImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "background_image"
    }
}
