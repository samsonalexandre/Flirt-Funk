//
//  RegisterImageView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 24.01.24.
//

import SwiftUI

struct RegisterImageView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("This is register image view")
            
            Button {
                viewModel.skipRegistrationFlow()
                dismiss()
            } label: {
                Text("Skip registration flow")
            }
        }
    }
}

#Preview {
    RegisterImageView()
}
