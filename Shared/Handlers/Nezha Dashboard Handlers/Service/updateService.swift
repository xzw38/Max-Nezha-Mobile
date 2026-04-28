//
//  updateService.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/9/24.
//

import Foundation
import SwiftyJSON

extension RequestHandler {
    static func updateService(service: ServiceData, name: String) async throws -> UpdateServiceResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/service/\(service.serviceID)",
            method: .patch,
            body: serviceBody(service: service, name: name, type: service.type, target: service.target, interval: service.interval)
        ))
    }

    static func updateService(service: ServiceData, name: String, type: ServiceType, target: String, interval: Int64) async throws -> UpdateServiceResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/service/\(service.serviceID)",
            method: .patch,
            body: serviceBody(service: service, name: name, type: type, target: target, interval: interval)
        ))
    }

    private static func serviceBody(service: ServiceData, name: String, type: ServiceType, target: String, interval: Int64) -> [String: Any] {
        [
            "name": name,
            "type": type.rawValue,
            "target": target,
            "duration": interval,
            "notification_group_id": service.notificationGroupID,
            "cover": service.coverageOption,
            "fail_trigger_tasks": service.failureTaskIDs ?? [],
            "recover_trigger_tasks": service.recoverTaskIDs ?? [],
            "min_latency": service.minimumLatency,
            "max_latency": service.maximumLatency,
            "skip_servers": service.excludeRule.object
        ]
    }
}
