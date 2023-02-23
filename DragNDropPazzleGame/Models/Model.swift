//
//  Model.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 23/02/2023.
//

import SwiftUI

struct Grid: Identifiable {
    var id = UUID().uuidString
    var iconName: String
    var icon: Image {
        Image(iconName)
    }
}
