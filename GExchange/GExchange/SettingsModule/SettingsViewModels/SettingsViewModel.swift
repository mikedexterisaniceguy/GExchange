//
//  SettingsViewModel.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var newPassword: String = ""
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updatePassword(newPassword: String) async throws {
        try await AuthenticationManager.shared.updatePassword(password: newPassword)
    }
}
