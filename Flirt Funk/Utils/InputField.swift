//
//  FlirtFunkInputField.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 23.01.24.
//

import SwiftUI

struct InputField: View {
    
    let imageName: String
    @State var placeholderText: String
    @Binding var text: String
    var isSecureField: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                        .textInputAutocapitalization(.never)
                }
            }
            .padding(4)
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

#Preview {
    InputField(imageName: "envelope", placeholderText: "email", text: .constant(""))
        .previewLayout(.sizeThatFits)
}
