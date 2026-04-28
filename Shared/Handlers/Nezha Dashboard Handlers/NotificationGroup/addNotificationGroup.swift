//
//  addNotificationGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func addNotificationGroup(name: String, notifications: [Int64] = []) async throws -> AddNotificationGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/notification-group",
            method: .post,
            body: [
                "name": name,
                "notifications": notifications
            ]
        ))
    }
}
