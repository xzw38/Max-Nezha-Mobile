//
//  renameServer.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 1/9/26.
//

import Foundation

extension RequestHandler {
    static func renameServer(serverID: Int64, to name: String) async throws -> RenameServerResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server/\(serverID)",
            method: .patch,
            body: ["name": name]
        ))
    }
}
