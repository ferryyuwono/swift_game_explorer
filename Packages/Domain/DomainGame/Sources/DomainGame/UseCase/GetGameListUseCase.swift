//
//  GetGameListUseCase.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct GetGameListUseCase {
    private let repository: GameRepositoriable
    
    public init(repository: GameRepositoriable) {
        self.repository = repository
    }

    public func getGameList(input: GetGameListInput) async -> GetGameListOutput {
        return await repository.getGameList(input: input)
    }
}
