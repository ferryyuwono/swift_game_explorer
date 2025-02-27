//
//  GetGameListResponse+Mapper.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import DomainGame

extension GetGameListResponse {
    func toDomainModel() -> GetGameListOutput {
        return GetGameListOutput(
            isSuccess: true,
            count: self.count ?? 0,
            next: self.next ?? "",
            results: self.results?.map { $0.toDomainModel() } ?? []
        )
    }
}
