//
//  deleteNotificationGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func deleteNotificationGroup(notificationGroups: [NotificationGroup]) async throws -> DeleteNotificationGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/notification-group",
            method: .post,
            body: notificationGroups.map { $0.notificationGroupID }
        ))
    }
}
