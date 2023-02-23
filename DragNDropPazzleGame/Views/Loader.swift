//
//  Loader.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 23/02/2023.
//

import SwiftUI




struct Loader: View {
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
              
                VStack(spacing: -40){
                        Text("Juicy")
                        Text("Sweet")
                        Text("Story")
                    
                    }
                    .font(.custom("Knewave-Regular", size: 90))
                    .glowBorder(color: mainAccentColor, lineWidth: 15)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 267)
                Spacer()
                Text("Loading...")
                    .frame(width: 146, height: 53)
                    .font(.custom("Knewave-Regular", size: 30))
                    .glowBorder(color: mainAccentColor, lineWidth: 7)
                    .foregroundColor(.white)
                    .padding(.bottom, 25)
                
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
