//
//  deleteService.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/9/24.
//

import Foundation

extension RequestHandler {
    static func deleteService(services: [ServiceData]) async throws -> DeleteServiceResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/batch-delete/service",
            method: .post,
            body: services.map { $0.serviceID }
        ))
    }
}
