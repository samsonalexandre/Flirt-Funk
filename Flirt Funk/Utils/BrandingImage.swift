//
//  BrandingImage.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 23.01.24.
//

import SwiftUI

struct BrandingImage: View {
    
    var size: CGFloat = 150
    
    var body: some View {
       Image("fire")
            .resizable()
            .frame(width: size, height: size)
            .padding()
    }
}

#Preview {
    BrandingImage()
}
