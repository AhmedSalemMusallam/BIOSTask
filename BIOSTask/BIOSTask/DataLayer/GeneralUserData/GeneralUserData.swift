//
//  GeneralUserData.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import Foundation

class UserData
{
    // Saving values to UserDefaults
    let defaults = UserDefaults.standard
    
    //UserLikedItems key
    let UserLikedItemsKey = "UserLikedItems"
    
    static var shared = UserData()
    
    func addLikedItem(id: String) {
        var likedItems = UserDefaults.standard.stringArray(forKey: UserLikedItemsKey) ?? []
        if !likedItems.contains(id) {
            likedItems.append(id)
            UserDefaults.standard.set(likedItems, forKey: UserLikedItemsKey)
        }
    }

    func removeLikedItem(id: String) {
        var likedItems = UserDefaults.standard.stringArray(forKey: UserLikedItemsKey) ?? []
        if let index = likedItems.firstIndex(of: id) {
            likedItems.remove(at: index)
            UserDefaults.standard.set(likedItems, forKey: UserLikedItemsKey)
        }
    }
    
    func isItemLiked(id: String) -> Bool {
        let likedItems = UserDefaults.standard.stringArray(forKey: UserLikedItemsKey) ?? []
        return likedItems.contains(id)
    }
}
