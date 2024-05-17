//
//  GamesModel.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 15/05/2024.
//

import Foundation

struct GameModel: Identifiable, Codable {
    var id: Int
    var title: String
    var worth: String
    var thumbnail: String
    var image: String
    var description: String
    var instructions: String
    var open_giveaway_url: String
    var published_date: String
    var type: String
    var platforms: String
    var end_date: String
    var users: Int
    var status: String
    var gamerpower_url: String
    var open_giveaway: String
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case title = "title"
        case worth = "worth"
        case thumbnail = "thumbnail"
        case image = "image"
        case description = "description"
        case instructions = "instructions"
        case open_giveaway_url = "open_giveaway_url"
        case published_date = "published_date"
        case type = "type"
        case platforms = "platforms"
        case end_date = "end_date"
        case users = "users"
        case status = "status"
        case gamerpower_url = "gamerpower_url"
        case open_giveaway = "open_giveaway"
       
    }
}
