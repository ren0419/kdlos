//
//  MemberListItemView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct MemberListItemView: View {
    let member: Member
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image(member.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing, 16)
            
            VStack(alignment: .leading, spacing: 2) {
                
                Text(member.name)
                    .font(.title3.weight(.heavy))
                    .foregroundStyle(.white)
                
                
                Text(member.jpName)
                    .font(.callout.weight(.heavy))
                    .foregroundStyle(.white)
                
                HStack(spacing: 8) {
                    Image(member.country)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26)
                    
                    Text(member.birthday)
                        .font(.subheadline)
                    
                    
                    Text(member.mbti)
                        .font(.subheadline)
                }
                Text(member.position)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    
            }
            Spacer()
            Image("arrow_right")
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let members: [Member] = Bundle.main.decode("zerobaseone.json")
    MemberListItemView(member: members[0])
        .padding()
}
