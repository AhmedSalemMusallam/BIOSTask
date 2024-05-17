//
//  GiveWaysEndDateSubView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 17/05/2024.
//

import SwiftUI

struct GiveWaysEndDateSubView: View {
    var end_date:String
    
    init(end_date: String) {
            self.end_date = end_date
        }
    var body: some View {
        HStack
        {
            VStack(alignment: .leading){
                Text("Giveways Enddate")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding([.horizontal])
                    .padding(.bottom,5)
                    .foregroundColor(.black)
                Text(end_date)
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
    GiveWaysEndDateSubView(end_date:"N/a")
}
