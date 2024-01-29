//
//  RegisterCompletionView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 29.01.24.
//

import SwiftUI

struct RegisterCompletionView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                Text("Step 6 of 6")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                Text("Hey, \(viewModel.currentUser?.name ?? "")")
                    .font(.title)
                    .padding()
                Text("That's all for now.")
                    .font(.headline)
                    .padding()
                Text("You can always update this in your profile page.")
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Button {
                    Task {
                        try await viewModel.completeRegistrationFlow()
                    }
                } label: {
                    Text("Finish")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                
                Button {
                    viewModel.skipRegistrationFlow()
                    dismiss()
                } label: {
                    Text("Skip for now")
                }
                .foregroundColor(.gray)
                
                Spacer()

            }
            if $viewModel.isLoading.wrappedValue {
                LoadingOverlayView()
            }
        }
    }
}

#Preview {
    RegisterCompletionView()
        .environmentObject(AuthViewModel())
}
