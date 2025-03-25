//
//  VoteGuideView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/03/07.
//

import SwiftUI

import SwiftUI

struct VoteGuideView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the member for you!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subtitle: "Swipe right",
                        description: "Are you intereted in this member? Touch the screen and swipe right. It will be saved to the favorites",
                        icon: "heart.circle"
                    )
                    
                    GuideComponent(
                        title: "Dismiss",
                        subtitle: "Swipe left",
                        description: "Not intereted in this member? Touch the screen and swipe right. It will be shown the next one without saving",
                        icon: "xmark.circle"
                    )
                    
                    GuideComponent(
                        title: "Book",
                        subtitle: "Tap the  button",
                        description: "Do you want to keep this member? Touch the BOOK button. It will be keeped in bookmarks",
                        icon: "checkmark.square"
                    )
                }
                
                Spacer(minLength: 10)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal,25)
        }
    }
}

#Preview {
    VoteGuideView()
}
