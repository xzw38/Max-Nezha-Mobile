//
//  deleteAlertRule.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/5/24.
//

import Foundation

extension RequestHandler {
    static func deleteAlertRule(alertRules: [AlertRuleData]) async throws -> DeleteAlertRuleResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/alert-rule",
            method: .post,
            body: alertRules.map { $0.alertRuleID }
        ))
    }
}
