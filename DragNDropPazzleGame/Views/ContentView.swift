//
//  ContentView.swift
//  DragNDropPazzleGame
//
//  Created by Artem on 22/02/2023.
//

import SwiftUI


struct DropViewDelegate: DropDelegate {
    
    var grid: Grid
    var gridData: GridViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        let fromIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == gridData.currentGrid?.id
        } ?? 0
        
        let toIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == self.grid.id
        } ?? 0
        
        if fromIndex != toIndex {
            withAnimation(.default){
                let fromGrid = gridData.gridItems[fromIndex]
                gridData.gridItems[fromIndex] = gridData.gridItems[toIndex]
                gridData.gridItems[toIndex] = fromGrid
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
struct ContentView: View {
    
    @StateObject var gridData = GridViewModel()
    
    @State var newArray: [String] = []
    @State var correctAnswer: String = "12345678910111213141516"
    @State var gameStatus = "Game Status"
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 2), count: 4)
    
    var body: some View {
        NavigationStack {
            VStack{
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 2, content: {
                        ForEach(gridData.gridItems){ grid in
                            grid.icon
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)
                            .onDrag({
                                gridData.currentGrid = grid
                                return NSItemProvider(object: String(grid.iconName) as NSString)
                            })
                            .onDrop(of: [.text], delegate: DropViewDelegate(grid: grid, gridData: gridData))
                        }
                    })
                    .padding()
                }
                
                Button{
                    gridData.gridItems.shuffle()
                    print(gridData.gridItems.description)
                    gridData.gridItems.forEach { item in
                        newArray.append(item.iconName)
                    }
                    print(newArray.description)
                    
                } label: {
                    Text("Shuffle")
                }
                
                Button{
                    gridData.gridItems.forEach { item in
                        newArray.append(item.iconName)
                    }
                    if  newArray.joined(separator: "") == correctAnswer {
                        gameStatus = "You win!"
                        print("you win!")
                        print(correctAnswer)
                        print(newArray.joined(separator: "").description)
                        newArray.removeAll()
                    } else {
                        print("you lose!")
                        print(correctAnswer)
                        print(newArray.joined(separator: "").description)
                        gameStatus = "You lose!"
                        newArray.removeAll()
                    }
                    
                } label: {
                    Text("Check answer")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle(gameStatus)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
