//
//  UserDataViewModel.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import Foundation

@MainActor
final class UserDataViewModel: ObservableObject {
    
    @Published var userData: UserData
    
    init() {
        self.userData = UserData(name: "", city: "", phoneNumber: "")
    }
    
    func createUser(name: String, city: String, phoneNumber: String) {
        self.userData = UserData(name: name, city: city, phoneNumber: phoneNumber)
    }
    
}
