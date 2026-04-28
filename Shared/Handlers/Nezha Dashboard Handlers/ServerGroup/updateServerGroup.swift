//
//  updateServerGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/1/24.
//

import Foundation

extension RequestHandler {
    static func updateServerGroup(serverGroup: ServerGroup, serverIDs: [Int64]) async throws -> UpdateServerGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server-group/\(serverGroup.serverGroupID)",
            method: .patch,
            body: [
                "name": serverGroup.name,
                "servers": serverIDs
            ]
        ))
    }

    static func updateServerGroup(serverGroup: ServerGroup, name: String) async throws -> UpdateServerGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server-group/\(serverGroup.serverGroupID)",
            method: .patch,
            body: [
                "name": name,
                "servers": serverGroup.serverIDs
            ]
        ))
    }
}
