//
//  GameRepositoriable.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public protocol GameRepositoriable {
    func getGameList(
        input: GetGameListInput
    ) async -> GetGameListOutput
}
