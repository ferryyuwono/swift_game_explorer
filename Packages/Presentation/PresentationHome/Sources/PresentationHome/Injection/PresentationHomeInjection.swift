//
//  PresentationHomeInjection.swift
//  PresentationHome
//
//  Created by Ferry Yuwono on 27/02/25.
//

import Swinject
import DomainGame

@MainActor
public struct PresentationHomeInjection {
    public static func register(container: Container) {
        container.register(HomeViewModel.self) { r in
            HomeViewModel(
                getGameListUseCase: r.resolve(GetGameListUseCase.self)!
            )
        }
        container.register(HomeView.self) { r in
            HomeView(
                viewModel: r.resolve(HomeViewModel.self)!
            )
        }
    }
}
