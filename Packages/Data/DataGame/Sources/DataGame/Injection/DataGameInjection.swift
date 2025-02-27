//
//  DataGameInjection.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import Swinject
import DomainGame

public struct DataGameInjection {
    public static func register(container: Container) {
        container.register(GameDataSource.self) { _ in GameDataSource() }
        container.register(GameRepositoriable.self) { r in
            GameRepository(
                gameDataSource: r.resolve(GameDataSource.self) ?? GameDataSource()
            )
        }
        container.register(GetGameListUseCase.self) { r in
            GetGameListUseCase(
                repository: r.resolve(GameRepositoriable.self) ?? GameRepository(
                    gameDataSource: r.resolve(GameDataSource.self) ?? GameDataSource()
                )
            )
        }
    }
}
