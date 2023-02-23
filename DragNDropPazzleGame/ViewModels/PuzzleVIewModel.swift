//
//  PuzzleVIewModel.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 23/02/2023.
//

import SwiftUI

class GridViewModel: ObservableObject{
    
    @Published var currentGrid: Grid?
    
    @Published var gridItems = [
        Grid(iconName: "1"),
        Grid(iconName: "2"),
        Grid(iconName: "3"),
        Grid(iconName: "4"),
        Grid(iconName: "5"),
        Grid(iconName: "6"),
        Grid(iconName: "7"),
        Grid(iconName: "8"),
        Grid(iconName: "9"),
        Grid(iconName: "10"),
        Grid(iconName: "11"),
        Grid(iconName: "12"),
        Grid(iconName: "13"),
        Grid(iconName: "14"),
        Grid(iconName: "15"),
        Grid(iconName: "16"),
    ]
    
}
