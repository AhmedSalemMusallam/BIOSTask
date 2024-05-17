//
//  ContentView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 14/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        VStack {
            if showSplash
            {
                SplashView()
                    .transition(.opacity)
            }
            else{
                //show Main Screen
                MainView(gameViewModel: GameViewModel())
            }
            
        }.onAppear
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
            {
                withAnimation(.easeOut(duration: 0.2)){
                    self.showSplash = false
                }
            }
            
        }
    }
}


