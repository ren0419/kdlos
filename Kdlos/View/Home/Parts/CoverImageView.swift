//
//  CoverImageView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct CoverImageView: View {
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    let tab: Tab
    
    var body: some View {
        let filteredGroupDatas = groupDatas.filter { $0.gender == tab.rawValue}
        TabView {
            ForEach(filteredGroupDatas) { item in
                Image(item.imageName)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CoverImageView(tab: .girls)
        .padding()
}
