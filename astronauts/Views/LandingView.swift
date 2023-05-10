//
//  LandingView.swift
//  astronauts
//
//  Created by m.maignanamoorthy on 09.05.23.
//

import SwiftUI


struct LandingScreenView: View {
    @State private var isActive = false
    @State private var size = 0.7
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            AstronautsView()
        } else {
            ZStack {
                Image("astronaut").resizable().scaledToFill().frame(width: 250, height: 800).aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
                
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom))
                
                VStack {
                    VStack {
                        Text("ASTRONAUTS").font(.title).fontWeight(.heavy).foregroundColor(.white)
                        Spacer()
                        Text("People embarked on intersteller travel").font(.system(size: 30, design: .monospaced)).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 3)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    
    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreenView()
    }
}
