//
//  deleteServerGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/1/24.
//

import Foundation

extension RequestHandler {
    static func deleteServerGroup(serverGroups: [ServerGroup]) async throws -> DeleteServerGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/server-group",
            method: .post,
            body: serverGroups.map { $0.serverGroupID }
        ))
    }
}
