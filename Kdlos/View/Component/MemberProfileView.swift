//
//  MemberProfileView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct MemberProfileView: View {
    @Environment(\.dismiss) private var dismiss
    let member: Member
    
    private func tagItemView(for title: String) -> some View {
        Text("# \(title)")
            .font(.subheadline)
            .foregroundColor(.primary)
            .padding(8)
            .lineLimit(1)
            .background(.blue.opacity(0.2))
            .cornerRadius(8)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 8) {
                Image(member.imageName) // 仮の画像
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                
                VStack(alignment: .center, spacing: 8) {
                    Text(member.name)
                        .font(.largeTitle).bold()
                    Text("\(member.jpName) | \(member.krName)")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 16) {
                    Label(member.birthday, systemImage: "calendar")
                    Label(member.mbti, systemImage: "person.circle")
                    Image(member.country)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 20)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .font(.headline)
                .padding(.top, 5)
                
                HeadingView(
                    headingImage: "signpost.right.circle",
                    headingText: "Position",
                    genderColor: .white
                )
                .padding(.top, 16)
                .padding(.bottom, 4)
                
                TagListView(
                    items: member.position.components(separatedBy: ", "),
                    horizontalSpacing: 4,
                    verticalSpacing: 4
                ) { item in
                    tagItemView(for: item)
                }
                .frame(height: 80)
                    
                
                HeadingView(
                    headingImage: "info.circle",
                    headingText: "Description",
                    genderColor: .white
                )
                
                
                Text(member.description)
                    .font(.subheadline.weight(.medium))
                    .padding()
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    if let url = URL(string: member.instagramLink) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    HStack {
                        Image(systemName: "link")
                        Text("Instagram")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let aespa: [Member] = Bundle.main.decode("aespa.json")
    MemberProfileView(member: aespa[0])
}
