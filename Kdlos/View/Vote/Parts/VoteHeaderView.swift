//
//  VoteHeaderView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/03/07.
//

import SwiftUI

struct VoteHeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            
            
            Spacer()
            
            Text("VOTE")
                .font(.headline.weight(.black))
            
            Spacer()
            
            Button {
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.accent)
            .sheet(isPresented: $showGuideView) {
                VoteGuideView()
            }
        }
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var showGuide = false
    @Previewable @State var showInfo = false
    VoteHeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
}
