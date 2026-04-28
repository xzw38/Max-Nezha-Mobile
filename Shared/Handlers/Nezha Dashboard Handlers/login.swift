//
//  login.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/29/24.
//

import Foundation

extension RequestHandler {
    static func login() async throws -> LoginResponse {
        guard let configuration = NMCore.getNezhaDashboardLoginConfiguration(endpoint: "/api/v1/login") else {
            throw NezhaDashboardError.invalidDashboardConfiguration
        }
        return try await performNezhaDashboardRequest(
            url: configuration.url,
            method: .post,
            body: [
                "username": configuration.username,
                "password": configuration.password
            ],
            auth: .unauthenticated
        )
    }
}
