//
//  GameViewModel.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 15/05/2024.
//

import Foundation
import Moya
import PromiseKit

class GameViewModel:ObservableObject{
    @Published var HorizontalGames :[GameModel] = [
        GameModel(id: 2846, title: "What The Fog Steam Key Giveaway", worth: "$4.99", thumbnail: "https://www.gamerpower.com/offers/1/6643a0fe953ab.jpg", image: "https://www.gamerpower.com/offers/1b/6643a0fe953ab.jpg", description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!", instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Register or Login into your free Behaviour account.\r\n3. Link your Steam account.\r\n4. Click the button to copy your FREE Steam key\r\n5. Launch the Steam client and click the Games menu option.\r\n6. Choose \"activate a Product on Steam\" to redeem your Steam key.", open_giveaway_url: "https://www.gamerpower.com/open/what-the-fog-steam-key-giveaway", published_date: "2024-05-14 13:35:58", type: "Game", platforms: "PC, Steam", end_date: "N/A", users: 2620, status: "Active", gamerpower_url: "https://www.gamerpower.com/what-the-fog-steam-key-giveaway", open_giveaway: "https://www.gamerpower.com/open/what-the-fog-steam-key-giveaway")
       
    ]
    
    @Published var VerticalGames :[GameModel] = [
        GameModel(id: 2846, title: "What The Fog Steam Key Giveaway", worth: "$4.99", thumbnail: "https://www.gamerpower.com/offers/1/6643a0fe953ab.jpg", image: "https://www.gamerpower.com/offers/1b/6643a0fe953ab.jpg", description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!", instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Register or Login into your free Behaviour account.\r\n3. Link your Steam account.\r\n4. Click the button to copy your FREE Steam key\r\n5. Launch the Steam client and click the Games menu option.\r\n6. Choose \"activate a Product on Steam\" to redeem your Steam key.", open_giveaway_url: "https://www.gamerpower.com/open/what-the-fog-steam-key-giveaway", published_date: "2024-05-14 13:35:58", type: "Game", platforms: "PC, Steam", end_date: "N/A", users: 2620, status: "Active", gamerpower_url: "https://www.gamerpower.com/what-the-fog-steam-key-giveaway", open_giveaway: "https://www.gamerpower.com/open/what-the-fog-steam-key-giveaway")
       
    ]
    
    @Published var Platforms = [
        "all","pc", "steam", "epic-games-store", "ubisoft", "gog", "itchio", "ps4", "ps5", "xbox-one", "xbox-series-xs", "switch", "android", "ios", "vr", "battlenet", "origin", "drm-free", "xbox-360"
    ]
    
    private let gameService = MoyaProvider<GameService>()
    private let loading = BGLoading()
    
    func getGameDataAPI(parameters:[String:String]){
            
            firstly { () -> Promise<Any> in
                loading.showLoading()
                return BGServices.manger.CallApi(self.gameService,GameService.GetGameData(paramters: parameters))
            }.done({ [self] response in
                let result = response as! Response
                guard BGNetworkHelper.validateResponse(response: result) else{return}
                let respone : [GameModel] = try BGDecoder.decode(data: result.data)
                
                HorizontalGames = respone
                VerticalGames = respone
                
                
            }).ensure { [weak self] in
                guard let self = self else{return}
                self.loading.dismissLoading()
            }.catch { (error) in
                print(error)
            }
    }
    
    func getGameDataByPlatFormAPI(parameters:[String:String]){
            
            firstly { () -> Promise<Any> in
                loading.showLoading()
                return BGServices.manger.CallApi(self.gameService,GameService.GetGameData(paramters: parameters))
            }.done({ [self] response in
                let result = response as! Response
                guard BGNetworkHelper.validateResponse(response: result) else{return}
                let respone : [GameModel] = try BGDecoder.decode(data: result.data)
                
               
                VerticalGames = respone
                
                
            }).ensure { [weak self] in
                guard let self = self else{return}
                self.loading.dismissLoading()
            }.catch { (error) in
                print(error)
            }
    }
    
}





