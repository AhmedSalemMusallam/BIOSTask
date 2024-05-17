//
//  DetailsView.swift
//  BIOSTask
//
//  Created by Ahmed Salem on 16/05/2024.
//

import SwiftUI


struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    //States
    @State var isLiked:Bool
    @State private var likedItemIDs: [String] = []
    //variables
    var id: Int
    var title: String
    var image: String
    var worth: String
    var users: Int
    var type:String
    var platforms: String
    var end_date: String
    var description: String
    
    init(id: Int, title: String, image:String, worth: String, users: Int, type:String, platforms: String, end_date:String, description:String) {
        self.id = id
        self.title = title
        self.image = image
        self.worth = worth
        self.users = users
        self.type = type
        self.platforms = platforms
        self.end_date = end_date
        self.description = description
        self._isLiked = State(initialValue: false)
        }
    
    var body: some View {
    
       NavigationView
        {
            ScrollView {
                VStack {
                    //Start Header
                    ZStack{
                        
                        VStack {
                            // Custom back button
                            HStack
                            {
                                //back button
                                Button(action: {
                                    // Dismiss this view and go back to the first view
                                    presentationMode.wrappedValue.dismiss()
                                    
                                }, label: {
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color.white)
                                            .frame(width: 30 , height: 30)
                                        
                                        Image(systemName: "chevron.backward")
                                            .foregroundColor(.black)
                                    }
                                    .padding(10)
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                                
                                Spacer()
                                
                                //Fav button
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
                            }
                            .padding(.top,40)
                            
                            Spacer()
                        
                            
                            //Title and GET in Button
                            HeaderTitleAnfGetInSubView(title: title)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(
                            //Header BG
                            HeaderBGSubView(image: image)
                    )
                        .background(ignoresSafeAreaEdges: .all)
                    }.frame(height: 300)
                    //End Header
                    
                    Spacer()
                    
                    //Icons with Text
                    SecondViewSubView(worth: worth, users: users, type: type)
                    
                    
                    //platforms
                    PlatformsSubVeiw(platforms:platforms)
                    
                    //Give ways end date
                    GiveWaysEndDateSubView(end_date:end_date)
                    
                    //Description
                    DescriptionSubView(description: description)
                }
                
            }
            .ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
        
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
    DetailsView(id: 12, title: "What The Fog Steam Key Giveaway", image: "https://www.gamerpower.com/offers/1/6643a0fe953ab.jpg", worth: "$4.99", users: 2620, type: "Game", platforms: "PC, Steam", end_date: "N/A", description: "Claim your free What The Fog Steam Key via Behaviour (the official developer website)! What The Fog is a 2-person co-op roguelite game filled with magic powers, non-stop action and lots of monsters! Check it out!")

}
