//
//  deleteServer.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 1/9/26.
//

import Foundation

extension RequestHandler {
    static func deleteServer(serverID: Int64) async throws -> DeleteServerResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/server",
            method: .post,
            body: [serverID]
        ))
    }
}
