//
//  ProfileView.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
}

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    @EnvironmentObject var userDataViewModel: UserDataViewModel
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Your profile")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                Text("Hi, \(userDataViewModel.userData.name)!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("You are in \(userDataViewModel.userData.city)")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack {
                    Text("Your contacts:")
                    
                    if let user = viewModel.user {
                        if let email = user.email {
                            Text("Email is: \(email)")
                                .font(.title3)
                        }
                    }
                    Text("Phone number is: \(userDataViewModel.userData.phoneNumber)")
                        .font(.title3)
                }
                
                Spacer()
                
                NavigationLink {
                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    Text("Profile settings")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        
        .task {
            try? await viewModel.loadCurrentUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(showSignInView: .constant(false))
    }
}
