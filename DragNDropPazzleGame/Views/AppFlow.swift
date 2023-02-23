//
//  AppFlow.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 23/02/2023.
//

import SwiftUI

struct AppFlow: View {
    @State var isActive:Bool = false
    var body: some View {
        if self.isActive {
            if isActive == false {
                Loader()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                  withAnimation {
                                      self.isActive = true
                                  }
                              }
                        }
            } else {
                MainMenuView()
            }
        }
    }
}

struct AppFlow_Previews: PreviewProvider {
    static var previews: some View {
        AppFlow()
    }
}
