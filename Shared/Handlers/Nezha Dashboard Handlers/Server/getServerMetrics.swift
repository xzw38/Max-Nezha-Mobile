//
//  getServerMetrics.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func getServerMetrics(serverID: Int64, metric: String, period: String = "1d") async throws -> GetServerMetricsResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server/\(serverID)/metrics?metric=\(metric)&period=\(period)",
            auth: .authenticatedIfAvailable
        ))
    }
}
