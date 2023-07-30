//
//  GExchangeApp.swift
//  GExchange
//
//  Created by 123 on 26.07.23.
//

import SwiftUI
import Firebase

@main
struct GExchangeApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var userDataViewModel: UserDataViewModel = UserDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            
                MainScreenView()
                    .environmentObject(userDataViewModel)
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
