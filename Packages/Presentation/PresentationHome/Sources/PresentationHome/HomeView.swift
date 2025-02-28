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
                    HStack {
                        AsyncImage(
                            url: URL(
                                string: it.backgroundImage
                            )
                        ) { result in
                            result.image?
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: 150, height: 90)
                        
                        Text(
                            it.name
                        ).padding(
                            EdgeInsets(
                                top: 0,
                                leading: 0,
                                bottom: 0,
                                trailing: 8
                            )
                        )
                    }.padding(
                        EdgeInsets(
                            top: 4,
                            leading: 0,
                            bottom: 4,
                            trailing: 0
                        )
                    ).listRowSeparator(.hidden)
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
                    name: "Test",
                    backgroundImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCmgkix4DEJoToCFKP-g8ztCYa9bIuxAC3pA&s"
                ),
                Game(
                    id: 2,
                    name: "Test 2",
                    backgroundImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCmgkix4DEJoToCFKP-g8ztCYa9bIuxAC3pA&s"
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
