//
//  UserManager.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
    }
    
    init(
        userId: String,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.userId = userId
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case email = "email"
        case photoUrl = "photoUrl"
        case dateCreated = "dateCreated"
    }

}

final class UserManager {
    
    static let shared = UserManager()
    
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        return decoder
    }()
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
//    func updatetoFavoriteStatus(userId: String, isFavorite: Bool) async throws {
//        let data: [String: Any] = [
//            DBUser.CodingKeys.isFavorite.rawValue : isFavorite
//        ]
//
//        try await userDocument(userId: userId).updateData(data)
//    }
//
//    func addUserPreference(userId: String, preference: String) async throws {
//        let data: [String: Any] = [
//            DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayUnion([preference])
//        ]
//
//        try await userDocument(userId: userId).updateData(data)
//    }
//
//    func removeUserPreference(userId: String, preference: String) async throws {
//        let data: [String: Any] = [
//            DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayRemove([preference])
//        ]
//
//        try await userDocument(userId: userId).updateData(data)
//    }
//
//    func addFavoriteMovie(userId: String, movie: Movie) async throws {
//        guard let data = try? encoder.encode(movie) else {
//            throw URLError(.badURL)
//        }
//        let dict: [String: Any] = [
//            DBUser.CodingKeys.favoriteMovie.rawValue : data
//        ]
//
//        try await userDocument(userId: userId).updateData(dict)
//    }
//
//    func removeFavoriteMovie(userId: String) async throws {
//        let data: [String: Any?] = [
//            DBUser.CodingKeys.favoriteMovie.rawValue : nil
//        ]
//
//        try await userDocument(userId: userId).updateData(data as [AnyHashable : Any])
//    }
}
