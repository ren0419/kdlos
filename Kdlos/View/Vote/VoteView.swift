//
//  VoteView.swift
//  Kdlos
//
//  Created by katahira ren on 2025/02/28.
//

import SwiftUI

struct VoteView: View {
    @State private var showAlert: Bool = false
    @State private var showGuide = false
    @State private var showInfo = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCartIndex = 1
    @State private var cardRemovalTransiton = AnyTransition.trailingBottom
    
    let zerobaseone: [Member] = Bundle.main.decode("zerobaseone.json")
    
    @State var cardViews: [VoteCardView] = []
    
    init() {
        var views = [VoteCardView]()
        for index in 0..<2 {
            views.append(VoteCardView(member: zerobaseone[index]))
        }
        _cardViews = State(initialValue: views)
    }
    
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCartIndex += 1
        let zerobaseone = zerobaseone[lastCartIndex % zerobaseone.count]
        let newCardView = VoteCardView(member: zerobaseone)
        cardViews.append(newCardView)
    }
    
    private func isTopCard(cardView: VoteCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else { return false }
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(transition: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            VoteHeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            
            // MARK: - CARDS
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(
                            x: self.isTopCard(cardView: cardView)
                            ? self.dragState.translation.width
                            : 0.0,
                            y: self.isTopCard(cardView: cardView)
                            ? self.dragState.translation.height
                            : 0.0
                        )
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(
                            Angle(degrees: self.isTopCard(cardView: cardView)
                                  ? Double(self.dragState.translation.width / 12)
                                  : 0.0)
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: self.dragState.isDragging)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(transition: drag?.translation ?? .zero)
                                default :
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else { return }
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransiton = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransiton = .trailingBottom
                                    }
                                })
                                    .onEnded({ (value) in
                                        guard case .second(true, let drag?) = value else { return }
                                        
                                        if drag.translation.width < -self.dragAreaThreshold ||
                                            drag.translation.width > self.dragAreaThreshold {
                                            self.moveCards()
                                        }
                                    })
                        )
                        .transition(self.cardRemovalTransiton)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            VoteFooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("This has been added to your KeepList."),
                dismissButton: .default(Text("Happy Voiting!"))
            )
        }
    }
}

#Preview {
    VoteView()
}
