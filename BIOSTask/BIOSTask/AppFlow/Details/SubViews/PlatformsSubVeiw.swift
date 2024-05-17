//
//  PlatformsSubVeiw.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI

struct PlatformsSubVeiw: View {
    var platforms:String
    
    init(platforms: String) {
            self.platforms = platforms
        }
    var body: some View {
        HStack
        {
            VStack(alignment: .leading){
                Text("Platforms")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .padding(.bottom,5)
                    .foregroundColor(.black)
                Text(platforms)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding([.horizontal])
                    .foregroundColor(.gray)
            }
            Spacer()
            
        }
        .padding(.bottom, 10)
        .padding(.top, 10)
    }
}

#Preview {
    PlatformsSubVeiw(platforms: "PC, Steam")
}
