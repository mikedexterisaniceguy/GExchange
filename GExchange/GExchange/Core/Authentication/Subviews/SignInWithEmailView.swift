//
//  SignInWithEmailView.swift
//  GExchange
//
//  Created by 123 on 29.07.23.
//

import SwiftUI

struct SignInWithEmailView: View {
    
    @StateObject private var viewModel = SignInWithEmailViewModel()
    @EnvironmentObject var userDataViewModel: UserDataViewModel
    @Binding var showSignView: Bool
    @State private var name = ""
    @State private var city = ""
    @State private var phoneNumber = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter your name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            TextField("Enter your city", text: $city)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            TextField("Enter your phone number", text: $phoneNumber)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            TextField("Enter your email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Enter your password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task {
                    userDataViewModel.createUser(name: name, city: city, phoneNumber: phoneNumber)
                    do {
                        try await viewModel.signUp()
                        showSignView = false
                    } catch {
                        print(error)
                    }
                    
                    do {
                        try await viewModel.signIn()
                        showSignView = false
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()

            
        }
        .padding()
        .navigationTitle("Sign in with email")
    }
}

struct SignInWithEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SignInWithEmailView(showSignView: .constant(false))
        }
    }
}
