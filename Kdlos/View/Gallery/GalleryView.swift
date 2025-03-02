//
//  GalleryView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct GalleryView: View {
    
    let aespa: [Member] = Bundle.main.decode("aespa.json")
    let zerobaseone: [Member] = Bundle.main.decode("zerobaseone.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    @State private var selectedMember: Member? = nil
    @State private var selectedMemberAnimation: Double = 0.0
    
    var members: [Member] {
        aespa + zerobaseone
    }
    
    // TODO: gender判別を正確にする
    func genderColor(_ member: Member) -> Color {
        member.id.contains("aespa") ? .pink : .indigo
    }
    
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 16) {
                    ZStack {
                        Circle()
                            .stroke(genderColor(selectedMember ?? members[0]), lineWidth: 2)
                            .frame(width: 180, height: 180, alignment: .center)
                            .scaleEffect(1 + CGFloat(selectedMemberAnimation))
                            .opacity(1 - selectedMemberAnimation)
                        
                        NavigationLink(destination: MemberProfileView(member: selectedMember ?? members[0])) {
                            Image(selectedMember?.imageName ?? members[0].imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(
                                        genderColor(selectedMember ?? members[0]),
                                        lineWidth: 4)
                                }
                                .frame(height: 250)
                        }
                    }
                    .onAppear {
                        withAnimation(
                            Animation.easeOut(duration: 2).repeatForever(autoreverses: false)
                        ) {
                            selectedMemberAnimation  = 1
                        }
                    }
                    
                    Text(selectedMember?.name ?? members[0].name)
                        .font(.title3.weight(.bold))
                    
                    Slider(value: $gridColumn, in: 2...5, step: 1)
                        .padding(.horizontal)
                        .onChange(of: gridColumn) {
                            withAnimation {
                                gridSwitch()
                            }
                        }
                    
                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                        ForEach(members) { member in
                            Image(member.imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(
                                        genderColor(member),
                                        lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedMember = member
                                    haptics.impactOccurred()
                                }
                                .padding(.horizontal, 12)
                        }
                    }
                    .onAppear {
                        gridSwitch()
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 50)
            }
            .background(CircleAnimationView())
        }
    }
}

#Preview {
    GalleryView()
}
