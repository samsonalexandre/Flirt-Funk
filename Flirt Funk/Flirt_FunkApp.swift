//
//  Flirt_FunkApp.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 22.01.24.
//

import SwiftUI
import Firebase

@main
struct Flirt_FunkApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
