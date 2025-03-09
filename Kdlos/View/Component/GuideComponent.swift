//
//  GuideComponent.swift
//  Kdlos
//
//  Created by katahira ren on 2025/03/07.
//

import SwiftUI

struct GuideComponent: View {
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .font(.title.weight(.heavy))
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote.weight(.heavy))
                        .foregroundStyle(.pink)
                }
                Divider().padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
        }
    }
}

#Preview {
    GuideComponent(
        title: "Title",
        subtitle: "Swipe right",
        description: "This is a afanfojabfafoaofaof",
        icon: "heart.circle"
    )
}
