//
//  MainView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("HOME")
                }
            
//            VideoView()
//                .tabItem {
//                    Image(systemName: "play.rectangle")
//                    Text("VIDEO")
//                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("GALLERY")
                }
        }
    }
}

#Preview {
    MainView()
}
