//
//  getNotificationGroup.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 2/15/26.
//

import Foundation

extension RequestHandler {
    static func getNotificationGroup() async throws -> GetNotificationGroupResponse {
        try await send(NezhaDashboardEndpoint("/api/v1/notification-group"))
    }
}
