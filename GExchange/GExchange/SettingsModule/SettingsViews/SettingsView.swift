//
//  SettingsView.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            Text("Private settings")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            
            Spacer()
            
            emailSection
            
            Spacer()
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSignInView: .constant(false))
    }
}


extension SettingsView {
    private var emailSection: some View {
        VStack {
            SecureField("New password...", text: $viewModel.newPassword)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    do {
                        try await viewModel.updatePassword(newPassword: viewModel.newPassword)
                        print("Updated password")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Update password")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            Button {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Reseted password")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Reset password")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            
            Button {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Log out")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
    }
}
