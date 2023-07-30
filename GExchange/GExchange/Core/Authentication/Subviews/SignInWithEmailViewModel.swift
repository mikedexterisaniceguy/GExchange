//
//  SignInWithEmailViewModel.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        let user = DBUser(auth: authDataResult)
        try await UserManager.shared.createNewUser(user: user)
    }
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
}
