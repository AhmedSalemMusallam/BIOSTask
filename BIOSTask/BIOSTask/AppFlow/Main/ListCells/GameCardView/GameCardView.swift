//
//  GameCardView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 14/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameCardView: View {
    //states
    @State var isLiked:Bool
    @State private var likedItemIDs: [String] = []
    
    //variables
    var id:Int
    var imageURL: String
    var title: String
    var platform: String
    var description: String

    init(id:Int, imageURL: String, title: String, platform:String, description: String) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.platform = platform
        self.description = description
        self._isLiked = State(initialValue: false)
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, content: {
                VStack(alignment: .leading,spacing:2) {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(4)
                        .font(.system(size: 20))
                        .padding(.bottom,10)
                        .frame(height: 80)
                        .multilineTextAlignment(.leading)
                    
                    Text(platform)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                        .lineLimit(6)
                        .font(.system(size: 10))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                Button{
                    self.isLiked.toggle()
                    let itemID = "\(self.id)"
                    
                    if UserData.shared.isItemLiked(id: itemID) {
                        UserData.shared.removeLikedItem(id: itemID)
                    } else {
                        UserData.shared.addLikedItem(id: itemID)
                    }
                    
                }label: {
                    ZStack{
                        image(Image(systemName: "heart.fill"),show: isLiked)
                        image(Image(systemName: "heart"),show: !isLiked)
                    }
                }
                .padding()
                .onAppear{
                    self.isLiked = UserData.shared.isItemLiked(id: String(id)) ? true:false
                    likedItemIDs = UserDefaults.standard.stringArray(forKey: UserData.shared.UserLikedItemsKey) ?? []
                }
                
                
            })
            
            Spacer()
            Text(description)
                .font(.caption)
                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                .lineLimit(6)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity,maxHeight: 300)
        .padding()
        .background(
            ZStack {
                    WebImage(url: URL(string: imageURL))
                        .resizable()
                        .indicator(.activity)
                        .aspectRatio(contentMode: .fill)
                    
                    // Overlay with a colored rectangle
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.5))
                }
        )
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        
        
        
        
        
    }
    
    
    func image(_ image: Image, show: Bool) -> some View{
        image
            .tint(isLiked ? .white : .white)
            .font(.system(size: 25))
            .scaleEffect(show ? 1 : 0)
            .opacity(show ? 1 : 0)
            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: show)
    }
}

#Preview {
    GameCardView(id:0,imageURL: Constants.randomImageURL, title: "What The Fog Steam Key Giveaway",platform: "PC Steam", description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!")

}
