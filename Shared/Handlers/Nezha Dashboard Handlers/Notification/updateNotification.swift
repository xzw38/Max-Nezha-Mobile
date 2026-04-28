//
//  updateNotification.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/4/24.
//

import Foundation

extension RequestHandler {
    static func updateNotification(notification: NotificationData, name: String) async throws -> UpdateNotificationResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/notification/\(notification.notificationID)",
            method: .patch,
            body: [
                "name": name,
                "url": notification.url,
                "request_method": notification.requestMethod,
                "request_type": notification.requestType,
                "request_header": notification.requestHeader,
                "request_body": notification.requestBody,
                "verify_tls": notification.isVerifyTLS,
                "skip_check": true
            ]
        ))
    }
}
