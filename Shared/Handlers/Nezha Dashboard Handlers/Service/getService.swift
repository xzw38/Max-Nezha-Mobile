//
//  getService.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/9/24.
//

import Foundation

extension RequestHandler {
    static func getService() async throws -> GetServiceResponse {
        try await send(NezhaDashboardEndpoint(
            "/api/v1/service/list",
            auth: .unauthenticated
        ))
    }
}
