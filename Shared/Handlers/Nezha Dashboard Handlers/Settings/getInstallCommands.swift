//
//  getInstallCommands.swift
//  Nezha Mobile
//
//  Created by Junhui Lou on 1/2/26.
//

import Foundation

extension RequestHandler {
    static func getInstallCommands() async throws -> (String, String, String) {
        async let settingResponse: GetSettingResponse = send(NezhaDashboardEndpoint("/api/v1/setting"))
        async let profileResponse: GetProfileResponse = send(NezhaDashboardEndpoint("/api/v1/profile"))

        let setting = try await settingResponse
        let profile = try await profileResponse

        let installHost = setting.data!.config.install_host
        let agentSecret = profile.data!.agent_secret

        let linuxCommand = "curl -L https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.sh -o agent.sh && chmod +x agent.sh && env NZ_SERVER=\(installHost) NZ_TLS=false NZ_CLIENT_SECRET=\(agentSecret) ./agent.sh"
        let macOSCommand = "curl -L https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.sh -o agent.sh && chmod +x agent.sh && env NZ_SERVER=\(installHost) NZ_TLS=false NZ_CLIENT_SECRET=\(agentSecret) ./agent.sh"
        let windowsCommand = "$env:NZ_SERVER=\"\(installHost)\";$env:NZ_TLS=\"false\";$env:NZ_CLIENT_SECRET=\"\(agentSecret)\"; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Ssl3 -bor [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12;set-ExecutionPolicy RemoteSigned;Invoke-WebRequest https://raw.githubusercontent.com/nezhahq/scripts/main/agent/install.ps1 -OutFile C:install.ps1;powershell.exe C:install.ps1"

        return (linuxCommand, macOSCommand, windowsCommand)
    }
}
