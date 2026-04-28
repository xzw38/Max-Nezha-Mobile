//
//  deleteNotification.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/4/24.
//

import Foundation

extension RequestHandler {
    static func deleteNotification(notifications: [NotificationData]) async throws -> DeleteNotificationResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/notification",
            method: .post,
            body: notifications.map { $0.notificationID }
        ))
    }
}
