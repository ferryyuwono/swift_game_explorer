//
//  GameExplorerApp.swift
//  GameExplorer
//
//  Created by Ferry Yuwono on 25/02/25.
//

import SwiftUI
import Swinject
import DataGame
import PresentationHome

@main
struct GameExplorerApp: App {
    init() {
        registerInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            Container.shared.resolve(HomeView.self)
        }
    }
    
    private func registerInjection() {
        DataGameInjection.register(container: Container.shared)
        PresentationHomeInjection.register(container: Container.shared)
    }
}
