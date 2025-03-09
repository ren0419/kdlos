//
//  CardView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/03/07.
//

import SwiftUI

struct VoteCardView: View, Identifiable {
    
    let id = UUID()
    var member: Member
    
    var body: some View {
        Image(member.imageName)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay (
                VStack(alignment: .center, spacing: 12) {
                    Text(member.name.uppercased())
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.bold))
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    Text(member.id)
                        .foregroundStyle(.black)
                        .font(.footnote.weight(.bold))
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(.white)
                        )
                }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                alignment: .bottom
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let zerobaseone: [Member] = Bundle.main.decode("zerobaseone.json")
    VoteCardView(member: zerobaseone[0])
        .padding()
}
