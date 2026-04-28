//
//  NezhaDashboardBaseResponse.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 11/19/24.
//

protocol NezhaDashboardBaseResponse {
    var success: Bool? { get }
    var error: String? { get }
}

struct NezhaDashboardAckResponse: Codable, NezhaDashboardBaseResponse {
    let success: Bool?
    let error: String?
}
