//
//  GetGameListInput+Mapper.swift
//  DataGame
//
//  Created by Ferry Yuwono on 27/02/25.
//

import DomainGame

extension GetGameListInput {
    func toDataModel() -> GetGameListRequest {
        return GetGameListRequest(
            page: self.page,
            pageSize: self.pageSize,
            dates: self.startDate.formatted(.iso8601.year().month().day()) + "," + self.endDate.formatted(.iso8601.year().month().day())
        )
    }
}
