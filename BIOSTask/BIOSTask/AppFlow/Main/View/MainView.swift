//
//  MainView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 14/05/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var gameViewModel:GameViewModel
    @State private var selectedPlatform: String = "all"
    @State private var isActive: Bool = false
    @State private var SelectedGame: GameModel?
    
    
    init(gameViewModel: GameViewModel) {
        self.gameViewModel = gameViewModel
    }
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    //Header
                    HeaderView()
                    
                    //Give Ways Text
                    GiveWaysTextSubView()
                    
                    //horizontal scrolling
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        Spacer()
                        HStack(spacing:0)
                        {
                            ForEach(gameViewModel.HorizontalGames){ game in
                                
                                GeometryReader{ geometry in
                                    GameCardViewHorizontal(imageURL: game.image, title: game.title ,platform: game.platforms , description: game.description)
                                        .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -20), axis: (x: -5, y: 10, z: -10))
                                        
                                }.frame(width: 300)
                                
                                
                            }
                            
                        }.padding(.horizontal,40)
                        
                        
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width,height: 150)
                        .onAppear
                    {
                        gameViewModel.getGameDataAPI(parameters: [:])
                    }
                    
                    //cat horozontal scrolling
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(gameViewModel.Platforms, id: \.self) { platform in
                                Text(platform)
                                    .font(.system(size: 12))
                                    .fontWeight(.bold)
                                    .foregroundColor(selectedPlatform == platform  ? .black : .gray)
                                    .onTapGesture {
                                        selectedPlatform = platform
                                        var parameters:[String:String] = [:]
                                        parameters.updateValue("\(platform)", forKey: "platform")
                                        gameViewModel.getGameDataByPlatFormAPI(parameters:parameters)
                                    }
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 40)
                    .zIndex(1)
                    
                    
                    
                    
                    //vertical Menu
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        VStack
                        {
                            
                            ForEach(gameViewModel.VerticalGames){ game in
                                
                                //vertival scrolling
                                GameCardView(id:game.id, imageURL: game.image, title: game.title ,platform: game.platforms , description: game.description)
                                    .frame(width: UIScreen.main.bounds.width,height: 300)
                                    .onTapGesture {
                                        isActive = true
                                        SelectedGame = game
                                    }
                                
                                
                            }
                            
                        }
                        
                        NavigationLink(destination: DetailsView(id: SelectedGame?.id ?? 0, title: "What The Fog Steam Key Giveaway", image: SelectedGame?.image ?? "https://www.gamerpower.com/offers/1/6643a0fe953ab.jpg", worth: SelectedGame?.worth ?? "$4.99", users: SelectedGame?.users ?? 2620, type: SelectedGame?.type ?? "Game", platforms: SelectedGame?.platforms ?? "PC, Steam", end_date: SelectedGame?.end_date ?? "N/A", description: SelectedGame?.description ?? "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!"), isActive: $isActive) {
                            EmptyView()
                        }
                        
                        Spacer()
                    }.onAppear
                    {
                        gameViewModel.getGameDataAPI(parameters: [:])
                    }
                    
                }
            }
            
            
        }
    }
}

#Preview {
    MainView(gameViewModel: GameViewModel())
}
