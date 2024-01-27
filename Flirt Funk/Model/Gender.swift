//
//  Gender.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 27.01.24.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable, Codable {
    case man = "man"
    case woman = "woman"
    case unspecified = "unspecified"
    
    var id: Self { self }
    
    static func fromString(str: String) -> Gender {
        switch str.lowercased() {
        case "man": return .man
        case "woman": return .woman
        default: return .unspecified
        }
    }
}
