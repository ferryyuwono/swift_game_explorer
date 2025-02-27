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
    let container: Container = Container()
    
    init() {
        registerInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            container.resolve(HomeView.self)
        }
    }
    
    private func registerInjection() {
        DataGameInjection.register(container: container)
        PresentationHomeInjection.register(container: container)
    }
}
