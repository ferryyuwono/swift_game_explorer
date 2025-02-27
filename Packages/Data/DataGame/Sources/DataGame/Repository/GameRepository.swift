//
//  GameRepository.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import DomainGame

public struct GameRepository: GameRepositoriable {
    private let gameDataSource: GameDataSource
    
    public init(
        gameDataSource: GameDataSource
    ) {
        self.gameDataSource = gameDataSource
    }
    
    public func getGameList(
        input: GetGameListInput
    ) async -> GetGameListOutput {
        let request = input.toDataModel()
        guard let response = await gameDataSource.getGameList(request: request) else {
            return GetGameListOutput()
        }
        return response.toDomainModel()
    }
}
