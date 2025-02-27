//
//  GetGameListResponse+Mapper.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import DomainGame

extension GetGameListResponse {
    func toDomainModel(
        nextPage: Int = 0
    ) -> GetGameListOutput {
        return GetGameListOutput(
            isSuccess: true,
            count: self.count ?? 0,
            next: self.next ?? "",
            nextPage: nextPage,
            results: self.results?.map { $0.toDomainModel() } ?? []
        )
    }
}
