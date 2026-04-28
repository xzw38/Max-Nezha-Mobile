//
//  addNotification.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/2/24.
//

import Foundation

extension RequestHandler {
    static func addNotification(name: String, pushNotificationsToken: String) async throws -> AddNotificationResponse {
        let requestBody = """
        {
        "iOSDeviceToken": "\(pushNotificationsToken)",
        "title": "\(String(localized: "Alert"))",
        "body": "#NEZHA#"
        }
        """

        return try await send(NezhaDashboardEndpoint(
            "/api/v1/notification",
            method: .post,
            body: [
                "name": name,
                "url": NMCore.apnsSendAlertURLString,
                "request_method": 2,
                "request_type": 1,
                "request_header": "",
                "request_body": requestBody,
                "skip_check": true
            ]
        ))
    }
}
