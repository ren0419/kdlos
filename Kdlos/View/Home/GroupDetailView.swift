//
//  GroupDetailView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct GroupDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let groupData: GroupData
    var genderColor: Color {
        groupData.gender == "boys" ? .indigo : .pink
    }
    
    var members : [Member] {
        guard let members: [Member] = Bundle.main.decodeOrNull("\(groupData.id).json") else {
            return []
        }
        return members
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 16) {
                    Image(groupData.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360,height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding(.horizontal)
                    
                    Text(groupData.name)
                        .font(.largeTitle.weight(.heavy))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(
                            genderColor
                                .frame(height: 6)
                                .offset(y: 24)
                            
                        )
                    
                    Text(groupData.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.accent)
                        .padding(.horizontal)
                    
                    Group {
                        HeadingView(
                            headingImage: "photo.on.rectangle.angled",
                            headingText: "Gallery",
                            genderColor: genderColor
                        )
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        
                        InsetGalleryView(groupData: groupData)
                    }
                    .padding(.horizontal)
                    
                    Group {
                        HeadingView(
                            headingImage: "info.circle",
                            headingText: "All about \(groupData.name)",
                            genderColor: genderColor
                        )
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        
                        
                        Text(groupData.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                    }
                    .padding(.horizontal)
                    
                    Group {
                        HeadingView(
                            headingImage: "figure.2.arms.open",
                            headingText: "Members",
                            genderColor: genderColor
                        )
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        
                        
                        ForEach(members) { member in
                            NavigationLink(destination: MemberProfileView(member: member)) {
                                HStack {
                                    MemberListItemView(member: member)
                                    Spacer()
                                }
                                .padding(.bottom, 6)
                            }
                        }
                        
                    }
                    
                    Group {
                        HeadingView(
                            headingImage: "books.vertical",
                            headingText: "Learn More",
                            genderColor: genderColor
                        )
                        .padding(.top, 8)
                        .padding(.bottom, 12)
                        ExternalWebLinkView(groupData: groupData)
                    }
                    
                }
            }
            .navigationTitle("about \(groupData.name)")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    GroupDetailView(groupData: groupDatas[10])
        .padding()
}
