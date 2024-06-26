//
//  RegisterImageView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 24.01.24.
//

import SwiftUI
import PhotosUI

struct RegisterImageView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Step 1 of 6")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                Text("Hey, \(viewModel.currentUser?.name ?? "")")
                    .font(.title)
                    .padding()
                Text("Upload a photo")
                    .font(.headline)
                    .padding()
                
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .padding()
                        } else {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .padding()
                        }
                    }
                }
                .padding(.vertical, 8)
                
                NavigationLink {
                    RegisterAgeView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding()
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    Task {
                        try await viewModel.uploadUserImage()
                    }
                }))
                
                Button {
                    viewModel.skipRegistrationFlow()
                    dismiss()
                } label: {
                    Text("Skip for now")
                }
                .foregroundColor(.gray)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RegisterImageView()
        .environmentObject(AuthViewModel())
}
