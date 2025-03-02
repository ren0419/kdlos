//
//  HomeView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .boys
    
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    var filteredGroupDatas: [GroupData] {
        groupDatas.filter { $0.gender == selectedTab.rawValue}
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 12) {
                ToggleTabBarView(selectedTab: $selectedTab)
                    .padding(.horizontal, 32)
                
                List {
                    CoverImageView(tab: selectedTab)
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .padding(.bottom, 16)
                        .listRowBackground(Color.black)
                    
                    ForEach(filteredGroupDatas) { item in
                        NavigationLink(destination: GroupDetailView(groupData: item)) {
                            GroupListItemView(groupData: item)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.vertical, 24)
        }
    }
}

#Preview {
    HomeView()
}
