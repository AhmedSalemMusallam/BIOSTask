//
//  SecondViewSubView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI

struct SecondViewSubView: View {
    var worth:String
    var users:Int
    var type:String
    init(worth: String, users: Int, type: String) {
        self.worth = worth
        self.users = users
        self.type = type
    }
    var body: some View {
        HStack
        {
            Spacer()
            VStack(alignment: .center){
                Image(systemName:"dollarsign.square.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    
                
                Text(worth)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    
            }
            .frame(width: 100)
            
            Spacer()
            
            VStack(alignment: .center){
                Image(systemName:"person.2.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    
                
                Text("\(users)")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    
            }
            .frame(width: 100)
            
            Spacer()
            
            
            VStack(alignment: .center){
                Image(systemName:"gamecontroller.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    
                
                Text(type)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    
            }
            .frame(width: 100)
            
            Spacer()
        }
        .padding(.bottom, 10)
        .padding(.top, 10)
    }
}

#Preview {
    SecondViewSubView(worth: "$4.99", users: 2620, type: "Game")
}
