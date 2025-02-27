//
//  GetGameListOutput.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

public struct GetGameListOutput {
    public let isSuccess: Bool
    public let count: Int
    public let next: String
    public let results: [Game]
    
    public init(
        isSuccess: Bool = false,
        count: Int = 0,
        next: String = "",
        results: [Game] = []
    ) {
        self.isSuccess = isSuccess
        self.count = count
        self.next = next
        self.results = results
    }
}
