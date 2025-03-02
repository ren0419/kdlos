//
//  GroupListItemView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct GroupListItemView: View {
    let groupData: GroupData
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(groupData.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(groupData.name)
                    .font(.title2.weight(.heavy))
                    .foregroundStyle(.accent)
                
                Text(groupData.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
        .backgroundStyle(.black)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    GroupListItemView(groupData: groupDatas[0])
        .padding()
}
