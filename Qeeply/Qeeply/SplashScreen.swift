//
//  SplashScreen.swift
//  Qeeply
//
//  Created by Della Florine on 28/07/22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var isActive: Bool = false
    
    
    var body: some View {
        if isActive{
            ContentView()
        } else {
        ZStack{
            Color("AccentColor").ignoresSafeArea()
            VStack{
            Image("QeeplyLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeInOut(duration:0.8)){
                    self.size = 0.9
                    self.opacity = 1.00
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline:.now() + 2.0){
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
