//
//  ToggleTabBarView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct ToggleTabBarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            tabItem(title: "Boys", type: .boys)
            tabItem(title: "Girls", type: .girls)
        }
        .padding(6)
        .background(.gray)
        .clipShape(Capsule())
        .overlay(
            GeometryReader { geometry in
                let width = geometry.size.width / 2
                let height = geometry.size.height
                let xOffset = selectedTab == .boys ? 0 : width
                let paddingFactor: CGFloat = 0.1
            
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.2))
                    .frame(width: width * 0.9, height: geometry.size.height * 0.8)
                    .offset(x: xOffset + width * paddingFactor / 2, y: height * 0.1)
                    .animation(.spring(), value: selectedTab)
            }
        )
    }
    
    private func tabItem(title: String, type: Tab) -> some View {
        Button(action: {
            withAnimation(.easeIn) {
                selectedTab = type
            }
        }) {
            Text(title)
                .font(.title2.weight(.heavy))
                .foregroundColor(selectedTab == type
                                 ? selectedTab == .boys
                                 ? .indigo : .pink
                                 : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }
    }
}

//#Preview {
//    ToggleTabBarView(selectedTab: .boys)
//}
