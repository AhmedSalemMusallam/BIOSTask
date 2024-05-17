//
//  GameCardViewHorizontal.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 15/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameCardViewHorizontal: View {
    var imageURL: String
    var title: String
    var platform: String
    var description: String
    
    
    init(imageURL: String, title: String, platform:String, description: String) {
            self.imageURL = imageURL
            self.title = title
            self.platform = platform
            self.description = description
        }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(4)
                .font(.system(size: 16))
                .frame(height: 50)
                
            
            Spacer()
            Text(description)
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                .lineLimit(8)
                .font(.system(size: 10))
        }
        .frame(maxWidth: .infinity,maxHeight: 140)
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
}

#Preview {
    GameCardViewHorizontal(imageURL: Constants.randomImageURL, title: "What The Fog Steam Key Giveaway",platform: "PC Steam", description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!")
}
