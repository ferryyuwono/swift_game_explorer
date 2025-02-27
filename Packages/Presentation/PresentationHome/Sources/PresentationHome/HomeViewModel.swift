//
//  HomeViewModel.swift
//  PresentationHome
//
//  Created by Ferry Yuwono on 27/02/25.
//

import Foundation
import Combine
import DomainGame

@MainActor
public class HomeViewModel: ObservableObject {
    @Published var getGameListError: String = ""
    @Published var gameList: GetGameListOutput = GetGameListOutput()
    
    private let getGameListUseCase: GetGameListUseCase
    
    init(getGameListUseCase: GetGameListUseCase) {
        self.getGameListUseCase = getGameListUseCase
    }
    
    public func getGameList(
        input: GetGameListInput = GetGameListInput()
    ) {
        Task { @MainActor [getGameListUseCase] in
            let output = await getGameListUseCase.getGameList(input: input)
            if (!output.isSuccess) {
                self.getGameListError = "Error Load Game"
                return
            }
            
            if (input.page == 1) {
                self.gameList = output
                return
            }
            
            self.gameList = GetGameListOutput(
                isSuccess: true,
                count: self.gameList.count + output.count,
                next: output.next,
                nextPage: output.nextPage,
                results: self.gameList.results + output.results
            )
        }
    }
    
    public func loadMore() {
        getGameList(
            input: GetGameListInput(
                page: self.gameList.nextPage
            )
        )
    }
}
