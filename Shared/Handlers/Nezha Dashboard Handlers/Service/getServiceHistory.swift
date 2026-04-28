//
//  getServiceHistory.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func getServiceHistory(serviceID: Int64, period: String = "1d") async throws -> GetServiceHistoryResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/service/\(serviceID)/history?period=\(period)",
            auth: .authenticatedIfAvailable
        ))
    }
}
