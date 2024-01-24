//
//  SwipeView.swift
//  Flirt Funk
//
//  Created by Alexandre Samson on 22.01.24.
//

import SwiftUI

struct SwipeView: View {
    let potentialCards = Card.mockData
    
    var body: some View {
        VStack {
            if potentialCards.isEmpty {
                Spacer()
                Text("No profile available")
                Spacer()
            } else {
                ZStack {
                    ForEach(potentialCards) { card in
                        CardView(card: card)
                    }
                }
            }
        }
    }
}

struct CardView: View {
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    
    var body: some View {
        VStack {
            //CardView
            ZStack(alignment: .topLeading) {
                GeometryReader { geo in
                    Image(card.user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .foregroundColor(.white)
                }
                
                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                
                VStack {
                    Spacer()
                    HStack {
                        Text(card.user.name)
                            .font(.largeTitle)
                            .bold()
                        if let age = card.user.age {
                            Text(String(age))
                                .font(.title)
                        }
                    }
                    .foregroundColor(.white)
                }
                .padding()
                // like or nope to Picture
                HStack {
                    Image("like")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(Double(card.x / 10 - 1))
                    Spacer()
                    Image("nope")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                       .opacity(Double(card.x / 10 * -1 - 1))
                }
            }
            .background(.black)
            .cornerRadius(16)
            .padding(8)
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
            .gesture(DragGesture()
                .onChanged({ value in
                    withAnimation(.default) {
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                })
                    .onEnded({ value in
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 5, initialVelocity: 0)) {
                            switch value.translation.width {
                            case 0...100:
                                card.x = 0
                                card.y = 0
                                card.degree = 0
                            case let x where x > 100:
                                card.x = 1000
                                card.degree = 12
                            case (-100)...(-1):
                                card.x = 0
                                card.y = 0
                                card.degree = 0
                            case let x where x < -100:
                                card.x = -1000
                                card.degree = -12
                            default:
                                card.x = 0
                                card.y = 0
                            }
                        }
                    })
            )
            
            HStack {
                Spacer()
                Button {
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 5, initialVelocity: 0)) {
                        card.degree = -12
                        card.x = -1000
                    }
                } label: {
                    Image("dismiss_circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                Spacer()
                Button {
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 5, initialVelocity: 0)) {
                        card.degree = 12
                        card.x = 1000
                    }
                } label: {
                    Image("like_circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                Spacer()
            }
            .background(Color(.white))
        }
    }
}

#Preview {
    SwipeView()
}
