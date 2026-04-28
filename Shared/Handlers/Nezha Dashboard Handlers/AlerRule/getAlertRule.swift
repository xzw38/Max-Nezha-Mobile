//
//  getAlertRule.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/1/24.
//

import Foundation

extension RequestHandler {
    static func getAlertRule() async throws -> GetAlertRuleResponse {
        try await send(NezhaDashboardEndpoint("/api/v1/alert-rule"))
    }
}
