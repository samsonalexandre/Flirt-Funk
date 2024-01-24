//
//  LoadingOverlayView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 23.01.24.
//

import SwiftUI

struct LoadingOverlayView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            Spacer()
            ProgressView()
            Spacer()
        }
        .background(Color.black.opacity(0.25))
    }
}

#Preview {
    LoadingOverlayView()
}
