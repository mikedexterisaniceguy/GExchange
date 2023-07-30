//
//  MainView.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var selectTabView: Int = 0
    @State private var showSignView: Bool = false
    
    var body: some View {
        TabView(selection: $selectTabView) {
            StuffView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Stuff")
                }
                .tag(0)
            OverviewView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("My stuff")
                }
                .tag(1)
            ProfileView(showSignInView: $showSignView)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .onAppear {
            let authUser = try?  AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignView = authUser == nil ? true : false
            
        }
        .fullScreenCover(isPresented: $showSignView) {
            NavigationView {
                AuthenticationView(showSignView: $showSignView)
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
