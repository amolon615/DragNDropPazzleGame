//
//  MainMenuView.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 23/02/2023.
//

import SwiftUI


struct MenuItem: Identifiable {
    var id: Int
    var name: String
}

var menuItems = [
MenuItem(id: 1, name: "Play"),
MenuItem(id: 2, name: "Game Rules"),
MenuItem(id: 3, name: "Settings"),
MenuItem(id: 4, name: "Privacy Policy")
]

struct MainMenuView: View {
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            VStack (spacing: 20){
                Image("lollipop")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 233)
                    .padding(.top, 100)
                VStack{
                    ForEach(menuItems) { item in
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.white,lineWidth: 4)
                                   .background(RoundedRectangle(cornerRadius: 25).foregroundColor(mainAccentColor))
                                   .frame(width: 350, height: 70)
                            Text(item.name)
                                .font(.custom("Knewave-Regular", size: 34))
                                .foregroundColor(.white)
                         
                        }
                    }
                }
              
             
                
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
