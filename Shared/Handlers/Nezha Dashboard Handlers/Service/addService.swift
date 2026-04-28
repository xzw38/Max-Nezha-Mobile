//
//  addService.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/9/24.
//

import Foundation

extension RequestHandler {
    static func addService(name: String, type: ServiceType, target: String, interval: Int64) async throws -> AddServiceResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/service",
            method: .post,
            body: [
                "name": name,
                "type": type.rawValue,
                "target": target,
                "duration": interval
            ]
        ))
    }
}
