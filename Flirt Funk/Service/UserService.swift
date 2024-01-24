//
//  UserService.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 24.01.24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    @MainActor
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore()
            .collection(COLLECTION_USER).document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
}
