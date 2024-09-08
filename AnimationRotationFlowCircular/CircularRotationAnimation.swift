//  ContentView.swift
//  AnimationRotationFlowCircular
//  Created by Sumit on 08/09/24.

import SwiftUI

struct CircularRotationAnimation: View {
    
    @State private var startAnimation = false
    @State private var duration = 0.8
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing:50) {
                ZStack {
                    Circle()
                        .strokeBorder(.brown, lineWidth: 12)
                        .cornerRadius(160/2)
                        .frame(width:160,height:160)
                        .shadow(color:.yellow,radius: 5)
                        .overlay(content: {
                            Image("img")
                                .resizable()
                                .frame(width:140,height:140)
                                .cornerRadius(140/2)
                                .clipped()
                        })
                        .scaleEffect(animationAmount)
                        .animation(.easeInOut(duration: 1.2), value: animationAmount)
                    Circle()
                        .fill(.white)
                        .frame(width: 12, height: 12, alignment: .center)
                        .cornerRadius(12/2)
                        .offset(x: -74)
                        .rotationEffect(.degrees(startAnimation ? 360 : 0))
                        .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                                   value: startAnimation
                        )
                }
                
                Text("@Animation<->Effect@")
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .bold, design: .default))

                ZStack {
                    Circle()
                        .strokeBorder(.gray, lineWidth: 12)
                        .cornerRadius(160/2)
                        .frame(width:160,height:160)
                        .shadow(color:.yellow,radius: 5)
                        .overlay(content: {
                            Image("profile")
                                .resizable()
                                .frame(width:140,height:140)
                                .cornerRadius(140/2)
                                .clipped()
                        })
                        .scaleEffect(animationAmount)
                        .animation(.easeInOut(duration: 1.2), value: animationAmount)
                    Circle()
                        .fill(.black)
                        .frame(width: 12, height: 12, alignment: .center)
                        .cornerRadius(12/2)
                        .offset(x: -74)
                        .rotationEffect(.degrees(startAnimation ? 360 : 0))
                        .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                                   value: startAnimation
                    )
                }
                
                Text("@User<&-@>Profile@")
                    .foregroundStyle(.white)
                    .font(.system(size: 26, weight: .bold, design: .default))
                
                ZStack {
                    Circle()
                        .strokeBorder(.gray, lineWidth: 12)
                        .cornerRadius(160/2)
                        .frame(width:160,height:160)
                        .shadow(color:.yellow,radius: 5)
                        .overlay(content: {
                            Image("swiftUI-Img")
                                .resizable()
                                .frame(width:140,height:140)
                                .cornerRadius(140/2)
                                .clipped()
                        })
                        .scaleEffect(animationAmount)
                        .animation(.easeInOut(duration: 1.2), value: animationAmount)
                    Circle()
                        .fill(.yellow)
                        .frame(width: 12, height: 12, alignment: .center)
                        .cornerRadius(12/2)
                        .offset(x: -74)
                        .rotationEffect(.degrees(startAnimation ? 360 : 0))
                        .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false),
                                   value: startAnimation
                    )
                }

            }
         }
        .onAppear {
            withAnimation {
                self.startAnimation.toggle()
            }
              animationAmount += 0.1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                animationAmount  = 1.0
            }
        }
     }
  }

#Preview {
    CircularRotationAnimation()
}
