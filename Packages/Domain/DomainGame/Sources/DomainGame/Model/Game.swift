//
//  Game.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct Game: Identifiable, Sendable {
    public let id: Int
    public let name: String
    public let backgroundImage: String
    
    public init(
        id: Int = 0,
        name: String = "",
        backgroundImage: String = ""
    ) {
        self.id = id
        self.name = name
        self.backgroundImage = backgroundImage
    }
}
