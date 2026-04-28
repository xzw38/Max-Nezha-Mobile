//
//  getServer.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/19/24.
//

import Foundation

extension RequestHandler {
    static func getServer() async throws -> GetServerResponse {
        try await send(NezhaDashboardEndpoint("/api/v1/server"))
    }

    static func getServer(serverID: Int64) async throws -> GetServerResponse {
        try await send(NezhaDashboardEndpoint("/api/v1/server?id=\(serverID)"))
    }
}
