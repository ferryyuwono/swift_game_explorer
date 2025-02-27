//
//  Game.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct Game {
    public let id: Int
    public let name: String
    
    public init(
        id: Int = 0,
        name: String = ""
    ) {
        self.id = id
        self.name = name
    }
}
