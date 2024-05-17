//
//  DescriptionSubView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI

struct DescriptionSubView: View {
    var description:String
    init(description: String) {
        self.description = description
    }
    var body: some View {
        HStack
        {
            VStack(alignment: .leading){
                Text("Description")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .padding(.bottom,5)
                    .foregroundColor(.black)
                Text(description)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding([.horizontal])
                    .foregroundColor(.gray)
            }
            Spacer()
            
        }.padding(.bottom, 10)
    }
}

#Preview {
    DescriptionSubView(description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!")
}
