//
//  updateAlertRule.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/2/24.
//

import Foundation
import SwiftyJSON

extension RequestHandler {
    static func updateAlertRule(alertRule: AlertRuleData, name: String) async throws -> UpdateAlertRuleResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/alert-rule/\(alertRule.alertRuleID)",
            method: .patch,
            body: alertRuleBody(alertRule: alertRule, name: name, isEnabled: alertRule.isEnabled)
        ))
    }

    static func updateAlertRule(alertRule: AlertRuleData, isEnabled: Bool) async throws -> UpdateAlertRuleResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/alert-rule/\(alertRule.alertRuleID)",
            method: .patch,
            body: alertRuleBody(alertRule: alertRule, name: alertRule.name, isEnabled: isEnabled)
        ))
    }

    private static func alertRuleBody(alertRule: AlertRuleData, name: String, isEnabled: Bool) -> [String: Any] {
        [
            "name": name,
            "enable": isEnabled,
            "trigger_mode": alertRule.triggerOption,
            "notification_group_id": alertRule.notificationGroupID,
            "rules": alertRule.triggerRule.object,
            "fail_trigger_tasks": alertRule.failureTaskIDs,
            "recover_trigger_tasks": alertRule.recoverTaskIDs
        ]
    }
}
