//
//  GetGameListRequest.swift
//  DataGame
//
//  Created by Ferry Yuwono on 25/02/25.
//

public struct GetGameListRequest: Codable {
    let page: Int?
    let pageSize: Int?
    let platforms: Int?
    let dates: String?
    let ordering: String?
    let key: String?
    
    init(
        page: Int? = 0,
        pageSize: Int? = 10,
        platforms: Int? = 187,
        dates: String? = nil,
        ordering: String? = "-released",
        key: String? = "612dae8efd17443ba8004890223aec1d"
    ) {
        self.page = page
        self.pageSize = pageSize
        self.platforms = platforms
        self.dates = dates
        self.ordering = ordering
        self.key = key
    }
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageSize = "page_size"
        case platforms
        case dates
        case ordering
        case key
    }
}
