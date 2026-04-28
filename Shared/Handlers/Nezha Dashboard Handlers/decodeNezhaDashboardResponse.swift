//
//  NezhaDashboardDecoder.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/19/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum NezhaDashboardAuth {
    case authenticated
    case authenticatedIfAvailable
    case unauthenticated
}

struct NezhaDashboardEndpoint<Response: Decodable & NezhaDashboardBaseResponse> {
    let path: String
    let method: HTTPMethod
    let body: Any?
    let auth: NezhaDashboardAuth

    init(
        _ path: String,
        method: HTTPMethod = .get,
        body: Any? = nil,
        auth: NezhaDashboardAuth = .authenticated
    ) {
        self.path = path
        self.method = method
        self.body = body
        self.auth = auth
    }
}

extension RequestHandler {
    static func send<Response>(_ endpoint: NezhaDashboardEndpoint<Response>) async throws -> Response {
        guard let url = NMCore.getNezhaDashboardConfiguration(endpoint: endpoint.path)?.url else {
            throw NezhaDashboardError.invalidDashboardConfiguration
        }
        return try await performNezhaDashboardRequest(
            url: url,
            method: endpoint.method,
            body: endpoint.body,
            auth: endpoint.auth
        )
    }

    static func performNezhaDashboardRequest<Response: Decodable & NezhaDashboardBaseResponse>(
        url: URL,
        method: HTTPMethod,
        body: Any? = nil,
        auth: NezhaDashboardAuth = .authenticated
    ) async throws -> Response {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        switch auth {
        case .authenticated:
            let token = try await getToken()
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        case .authenticatedIfAvailable:
            if let token = try? await getToken() {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        case .unauthenticated:
            break
        }

        if let body {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }

        let (data, _) = try await URLSession.shared.data(for: request)
        return try decodeNezhaDashboardResponse(data: data)
    }

    static func decodeNezhaDashboardResponse<T: Decodable & NezhaDashboardBaseResponse>(data: Data) throws -> T {
        do {
            let response = try JSONDecoder().decode(T.self, from: data)

            if response.success == true {
                return response
            }

            throw NezhaDashboardError.invalidResponse(response.error ?? "Unknown error")
        } catch let error as DecodingError {
            handleDecodingError(error: error)
            throw error
        } catch {
            throw error
        }
    }
}
