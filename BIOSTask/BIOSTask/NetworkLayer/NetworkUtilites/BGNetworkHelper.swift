//
//  BGNetworkHelper.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 03/12/2023.
//

import Foundation
import Moya
import SystemConfiguration


// Define a Codable struct to represent the message response
struct MessageResponse: Codable {
    let error: String
}

struct MessageResponseV2: Codable {
    let code: Int
    let data:ErrorResponse
}
struct ErrorResponse: Codable {
    
    let error:String
}
struct BGNetworkHelper {
    
    
    // MARK: - print response
    fileprivate static func printResponse(_ response: Response) {
        // print request data
        print("URL:")
        print(response.request?.urlRequest ?? "")
        print("Header:")
        print((response.request?.headers ?? nil) as Any)
        print("STATUS:")
        print(response.statusCode)
        print("Response: \(response.data)")
        if let json = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) {
            print(json)
        } else {
            let response = String(data: response.data, encoding: .utf8)!
            print(response)
        }
    }
    
    // MARK: - validate all APIs responses
    static func validateResponse (response:Response) ->Bool {
        printResponse(response)
//        guard response.statusCode == BGConstants.success else{
//            if response.statusCode == 401 {
//                print("I'm Here in loginAPI4 - the status is -> 401")
//                UserData.shared.removeUserData()
////                BGAlertPresenter.displayToast(message: "You have to login first".localized ?? "")
//                do{
//                    // Try to decode the response data as JSON
//                    let messageResponse : MessageResponse = try BGDecoder.decode(data: response.data)
//                    
//                    BGAlertPresenter.displayToast(message: messageResponse.error)
//                }catch{
//                    print("An error occurred")
//                }
//                
//                //go to the login view
//                
//                let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//                
//                BGNavigator.rootNavigation(newViewController: vc)
//                
//                
//                
//            }else{
//                do{
//                    // Try to decode the response data as JSON
//                    let messageResponse : MessageResponse = try BGDecoder.decode(data: response.data)
//                    
//                    BGAlertPresenter.displayToast(message: messageResponse.error)
//                }catch{
//                    print("An error occurred")
//                }
//            }
//            
//
//            print("I'm Here in loginAPI4 - the status is -> 401")
//            return false
//        }
        
        if response.statusCode == BGConstants.success
        {
            return true
        }
        else{
            let decoder = JSONDecoder()
            do {
                let responseModel = try decoder.decode(ResponseModel.self, from: response.data)
                switch responseModel.code {
                case BGConstants.success? :
                    return true
                case BGConstants.added? , BGConstants.created?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    return true
                case BGConstants.unprocessableEntity?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    return false
                case BGConstants.notFound?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    return false
                case BGConstants.unauthenticated?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    //BGAuth.manger.logout()
                    return false
                case BGConstants.notAcceptable?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    print("I'm here -> \(responseModel.data?.message ?? "")")
                    return false
                case BGConstants.notActive?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    return  false
                    
                case BGConstants.failed?:
                    BGAlertPresenter.displayToast(title: "",message: responseModel.data?.message ?? "")
                    return  false
                    
                default:
                    return false
                }
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
    
    }
    
}
