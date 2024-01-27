//
//  RegisterGenderView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 27.01.24.
//

import SwiftUI

struct RegisterGenderView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Step 3 of 6")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                Text("Hey, \(viewModel.currentUser?.name ?? "")")
                    .font(.title)
                    .padding()
                Text("What are you looking for?")
                    .font(.headline)
                    .padding()
                
                Divider()
                
                HStack {
                    Text("I am a")
                        .padding(.trailing)
                        .frame(width: 150, alignment: .trailing)
                    Picker("Coose", selection: $viewModel.gender) {
                        ForEach(Gender.allCases) { gender in
                            switch gender {
                            case Gender.man: Text("Man")
                            case Gender.woman: Text("Woman")
                            case Gender.unspecified: Text("Unspecified")
                            }
                        }
                    }
                    .frame(width: 150, alignment: .leading)
                }
                
                Divider()
                
                HStack {
                    Text("Looking for")
                        .padding(.trailing)
                        .frame(width: 150, alignment: .trailing)
                    Picker("Coose", selection: $viewModel.lookingFor) {
                        ForEach(Gender.allCases) { gender in
                            switch gender {
                            case Gender.man: Text("Men")
                            case Gender.woman: Text("Women")
                            case Gender.unspecified: Text("Any")
                            }
                        }
                    }
                    .frame(width: 150, alignment: .leading)
                }
                
                NavigationLink {
                    RegisterBioView()
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
    RegisterGenderView()
        .environmentObject(AuthViewModel())
}
