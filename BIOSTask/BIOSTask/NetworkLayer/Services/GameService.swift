//
//  GameService.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 16/05/2024.
//

import Foundation
import Moya

enum GameService {
    
    case GetGameData(paramters:[String:String])
   
    
}

extension GameService: URLRequestBuilder {
    
    var path: String {
        switch self {
       
        case .GetGameData:
           
            return EndPoints.GetGameData.rawValue
        }

    }
    var method: Moya.Method {
        switch self {
        case .GetGameData:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        
        case .GetGameData(let paramters):
            return .requestParameters(parameters: paramters, encoding: URLEncoding.default)
        }
    }
}
