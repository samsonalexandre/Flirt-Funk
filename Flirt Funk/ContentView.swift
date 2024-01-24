//
//  ContentView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 22.01.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.currentUser == nil || viewModel.signupFlowActive {
            LoginView()
        } else {
            SwipeView()
        }
    }
}

#Preview {
    ContentView()
}
