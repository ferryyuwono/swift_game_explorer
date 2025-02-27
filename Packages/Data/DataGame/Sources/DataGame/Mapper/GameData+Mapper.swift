//
//  GameData+Mapper.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import DomainGame

extension GameData {
    func toDomainModel() -> Game {
        return Game(
            id: self.id ?? 0,
            name: self.name ?? ""
        )
    }
}
