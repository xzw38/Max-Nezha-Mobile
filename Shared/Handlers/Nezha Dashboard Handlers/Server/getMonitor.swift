//
//  getMonitor.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/19/24.
//

import Foundation

extension RequestHandler {
    static func getMonitor(serverID: Int64, period: String = "1d") async throws -> GetMonitorResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server/\(serverID)/service?period=\(period)",
            auth: .authenticatedIfAvailable
        ))
    }
}
