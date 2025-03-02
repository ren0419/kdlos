//
//  CircleAnimationView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/03/01.
//

import SwiftUI

struct CircleAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    private func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private func randomSpeed() ->Double {
        return Double.random(in: 0.025...1.0)
    }
    
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { index in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinates(max: geometry.size.width),
                            y: randomCoordinates(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear() {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

#Preview {
    CircleAnimationView()
}
