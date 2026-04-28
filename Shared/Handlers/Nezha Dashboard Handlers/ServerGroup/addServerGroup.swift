//
//  addServerGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/1/24.
//

import Foundation

extension RequestHandler {
    static func addServerGroup(name: String) async throws -> AddServerGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server-group",
            method: .post,
            body: [
                "name": name,
                "servers": []
            ]
        ))
    }
}
