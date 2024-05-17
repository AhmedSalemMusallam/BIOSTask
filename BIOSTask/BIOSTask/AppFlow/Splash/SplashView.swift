//
//  SplashView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 14/05/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isScaleUp = false
    @State private var isScaleDown = false
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            Text("Boubyan Task")
                .font(.title)
                .foregroundColor(.white)
                .scaleEffect(isScaleUp ? 1.5 : 1.0)
                .scaleEffect(isScaleDown ? 1.0 : 1.5)
                .onAppear{
                    withAnimation(.easeOut(duration: 0.2)){
                        isScaleUp = true
                    }
                    withAnimation(.easeOut(duration: 0.8)){
                        isScaleDown = true
                    }
                }
                
                
            
        }
    }
}

#Preview {
    SplashView()
}
