//
//  HeadingView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText: String
    var genderColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .imageScale(.large)
                .foregroundStyle(genderColor)
            
            Text(headingText)
                .font(.title3.weight(.bold))
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "", headingText: "", genderColor: .indigo)
}
