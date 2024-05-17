//
//  HeaderView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 16/05/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("👋")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                .padding([.top, .horizontal])
                
                Text("Hello, Muhammad")
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .padding([.top, .horizontal])
            }
            Spacer()
            Image("defaultPersonImage")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(.horizontal,20)
        }
    }
}

#Preview {
    HeaderView()
}
