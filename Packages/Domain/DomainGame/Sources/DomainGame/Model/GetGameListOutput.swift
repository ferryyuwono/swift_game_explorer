//
//  GetGameListOutput.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct GetGameListOutput: Sendable {
    public let isSuccess: Bool
    public let count: Int
    public let next: String
    public let nextPage: Int
    public let results: [Game]
    
    public init(
        isSuccess: Bool = false,
        count: Int = 0,
        next: String = "",
        nextPage: Int = 0,
        results: [Game] = []
    ) {
        self.isSuccess = isSuccess
        self.count = count
        self.next = next
        self.nextPage = nextPage
        self.results = results
    }
}
