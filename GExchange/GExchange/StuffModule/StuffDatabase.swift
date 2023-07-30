//
//  StuffDatabase.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import Foundation

struct StuffArray: Codable {
    let stuff: [Stuff]
    let total: Int
}

struct Stuff: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let state: Int
    let isFavorite: Bool
    let isUrgent: Bool
    let owner: String
    let phoneNumber: String
}
