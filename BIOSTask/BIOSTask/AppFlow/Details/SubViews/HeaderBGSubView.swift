//
//  HeaderBGSubView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeaderBGSubView: View {
    var image:String
    init(image: String) {
        self.image = image
    }
    var body: some View {
        ZStack {
            WebImage(url: URL(string: image))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            // Overlay with a colored rectangle
            Rectangle()
                .foregroundColor(Color.black.opacity(0.5))
        }
    }
}

#Preview {
    HeaderBGSubView(image: "https://www.gamerpower.com/offers/1/6643a0fe953ab.jpg")
}
