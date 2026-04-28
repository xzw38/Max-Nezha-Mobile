//
//  getServerGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/30/24.
//

import Foundation

extension RequestHandler {
    static func getServerGroup() async throws -> GetServerGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/server-group",
            auth: .unauthenticated
        ))
    }
}
