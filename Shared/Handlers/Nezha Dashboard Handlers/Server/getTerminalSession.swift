//
//  getTerminalSession.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 12/4/24.
//

import Foundation

extension RequestHandler {
    static func getTerminalSession(serverID: Int64) async throws -> (GetTerminalSessionResponse, String) {
        let token = try await getToken()
        let response: GetTerminalSessionResponse = try await send(NezhaDashboardEndpoint(
            "/api/v1/terminal",
            method: .post,
            body: ["server_id": serverID]
        ))
        return (response, token)
    }
}
