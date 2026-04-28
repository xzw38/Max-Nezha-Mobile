//
//  updateNotificationGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func updateNotificationGroup(notificationGroup: NotificationGroup, name: String) async throws -> UpdateNotificationGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/notification-group/\(notificationGroup.notificationGroupID)",
            method: .patch,
            body: [
                "name": name,
                "notifications": notificationGroup.notificationIDs
            ]
        ))
    }

    static func updateNotificationGroup(notificationGroup: NotificationGroup, notificationIDs: [Int64]) async throws -> UpdateNotificationGroupResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/notification-group/\(notificationGroup.notificationGroupID)",
            method: .patch,
            body: [
                "name": notificationGroup.name,
                "notifications": notificationIDs
            ]
        ))
    }
}
