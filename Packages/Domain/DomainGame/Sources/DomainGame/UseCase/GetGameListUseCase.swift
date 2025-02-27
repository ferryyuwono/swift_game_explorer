//
//  GetGameListUseCase.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct GetGameListUseCase {
    private let repository: GameRepositoriable
    
    public func getGameList(input: GetGameListInput) async -> GetGameListOutput {
        return await repository.getGameList(input: input)
    }
}
