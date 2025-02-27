//
//  HomeView.swift
//  PresentationHome
//
//  Created by Ferry Yuwono on 27/02/25.
//

import SwiftUI
import DomainGame

@MainActor
public struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    public var body: some View {
        VStack {
            List {
                ForEach(
                    viewModel.gameList.results
                ) { it in
                    Text(it.name).padding()
                }
                
                if !viewModel.gameList.next.isEmpty {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
                        .foregroundColor(.red)
                        .onAppear {
                            viewModel.loadMore()
                        }
                }
            }.refreshable {
                viewModel.getGameList()
            }
        }
        .onAppear {
            viewModel.getGameList()
        }
    }
}

private struct EmptyGameRepository: GameRepositoriable {
    public func getGameList(
        input: GetGameListInput
    ) async -> GetGameListOutput {
        return GetGameListOutput(
            isSuccess: true,
            results: [
                Game(
                    id: 1,
                    name: "Test"
                ),
                Game(
                    id: 2,
                    name: "Test 2"
                )
            ]
        )
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            getGameListUseCase: GetGameListUseCase(
                repository: EmptyGameRepository()
            )
        )
    )
}
