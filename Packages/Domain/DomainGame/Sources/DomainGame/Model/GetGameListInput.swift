//
//  GetGameListInput.swift
//  DomainGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import Foundation

public struct GetGameListInput {
    public let page: Int
    public let pageSize: Int
    public let startDate: Date
    public let endDate: Date
    
    public init(
        page: Int = 1,
        pageSize: Int = 10,
        startDate: Date = Date(),
        endDate: Date = Date()
    ) {
        self.page = page
        self.pageSize = pageSize
        self.startDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        self.endDate = endDate
    }
}
