//
//  ExternalWebLinkView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let groupData: GroupData
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(groupData.name, destination: (URL(string: groupData.link) ?? URL(string: "https://wikipedia.org"))!)
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let groupDatas: [GroupData] = Bundle.main.decode("group_datas.json")
    ExternalWebLinkView(groupData: groupDatas[3])
        .padding()
}
