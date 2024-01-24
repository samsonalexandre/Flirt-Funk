//
//  RegisterView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 23.01.24.
//

import SwiftUI

struct RegisterView: View {
    @State private var startRegistrationFlow = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack {
                BrandingImage()
                
                Text("Register")
                    .font(.largeTitle)
                    .padding()
                
                VStack(spacing: 32) {
                    InputField(imageName: "envelope", placeholderText: "email", text: $viewModel.email)
                    InputField(imageName: "person", placeholderText: "name", text: $viewModel.name)
                    InputField(imageName: "lock", placeholderText: "password", text: $viewModel.password, isSecureField: true)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                
                Button {
                    Task {
                        try await viewModel.register() {
                            startRegistrationFlow.toggle()
                        }
                    }
                } label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Alredy registered?")
                            .font(.footnote)
                        Text("Log in")
                            .font(.footnote)
                            .bold()
                    }
                }
                .padding(.bottom, 48)
            }
            if $viewModel.isLoading.wrappedValue {
                LoadingOverlayView()
            }
        }
        .alert(viewModel.errorEvent.content, isPresented: $viewModel.errorEvent.display) {
            Button("OK", role: .cancel) {
                startRegistrationFlow.toggle()
            }
                //.navigationDestination(isPresented: $startRegistrationFlow) {
                    //RegisterImageView()
                       // .navigationBarBackButtonHidden()
            }
        .sheet(isPresented: $startRegistrationFlow) {
            RegisterImageView()
                .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterView()
        .environmentObject(AuthViewModel())
}
