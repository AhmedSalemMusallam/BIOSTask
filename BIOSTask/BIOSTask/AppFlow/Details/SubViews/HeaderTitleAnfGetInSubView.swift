//
//  HeaderTitleAnfGetInSubView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI

struct HeaderTitleAnfGetInSubView: View {
    var title:String
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        
        HStack(spacing: 0)
        {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(4)
                .font(.system(size: 20))
                .padding(.bottom,10)
                .frame(height: 80)
                .multilineTextAlignment(.leading)
                .padding(.horizontal,10)
            Spacer()
            Button(action: {
                       // Action when the button is tapped
                   }) {
                       Text("Get it")
                           .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                           .font(.system(size: 14))
                           .foregroundColor(.black)
                           .padding(.vertical,5)
                           .padding(.horizontal,10)
                           .background(Color.white)
                           .cornerRadius(10)
                   }.padding(.horizontal,10)
            
            
            
            
            
        }
        .padding(.bottom, 0)
    }
}

#Preview {
    HeaderTitleAnfGetInSubView(title: "What The Fog Steam Key Giveaway")
}
