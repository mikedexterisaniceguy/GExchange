//
//  StuffManager.swift
//  GExchange
//
//  Created by 123 on 30.07.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class StuffManager {
    
    static let shared = StuffManager()
    
    private init() { }
    
    private let stuffCollection = Firestore.firestore().collection("stuff")
    
    private func stuffDocument(stuffId: String) -> DocumentReference {
        stuffCollection.document(stuffId)
    }
    
    func uploadStuff(stuff: Stuff) async throws {
        try stuffDocument(stuffId: stuff.id).setData(from: stuff, merge: false)
    }
    
    func getStuff(stuffId: String) async throws -> Stuff {
        try await stuffDocument(stuffId: stuffId).getDocument(as: Stuff.self)
    }
    
    func getAllStuff() async throws -> [Stuff] {
        try await stuffCollection.getDocuments(as: Stuff.self)
    }
    
    func getAllStuffSortedByState(descending: Bool) async throws -> [Stuff] {
        try await stuffCollection.order(by: "state", descending: descending).getDocuments(as: Stuff.self)
    }
}

extension Query {
    
    func getDocuments<T>(as type: T.Type) async throws -> [T] where T: Decodable {
        let snapshot = try await self.getDocuments()
        return try snapshot.documents.map({ document in
            try document.data(as: T.self)
        })
    }
    
}
