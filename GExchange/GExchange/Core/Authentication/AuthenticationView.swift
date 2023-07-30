//
//  AuthenticationView.swift
//  GExchange
//
//  Created by 123 on 29.07.23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @Binding var showSignView: Bool
    
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInWithEmailView(showSignView: $showSignView)
            } label: {
                Text("Sign in with email")
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
            .navigationTitle("Sign In")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        
            AuthenticationView(showSignView: .constant(false))
        
    }
}
