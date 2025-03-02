//
//  InsetGalleryView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct InsetGalleryView: View {
    let groupData: GroupData
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 16) {
                ForEach(groupData.galleries, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    InsetGalleryView(groupData: groupDatas[10])
        .padding()
}
