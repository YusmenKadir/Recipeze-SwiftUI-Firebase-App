//
//  PicGrid.swift
//  RecipeZe
//
//  Created by Wolfgang Rufaro Voigt.
//

import SwiftUI

struct PinItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imgString: String
    let imgText: String
    let url: String
}

struct PinGrid: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var pinItems = [PinItem]()
    }
    
    let columns: [Column]
    
    let spacing: CGFloat
    let horizontalPadding: CGFloat
    
    //This calculates the grid layout so it's more dynamic
    init (pinItems: [PinItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0 ..< numOfColumns {
            columns.append(Column())
        }
        
        //this stores the current height of each column, so that we can find out which out which one is the smallest
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        for pinItem in pinItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnsHeight.first!
            for i in 1 ..< columnsHeight.count {
                let curHeight = columnsHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            
            columns[smallestColumnIndex].pinItems.append(pinItem)
            columnsHeight[smallestColumnIndex] += pinItem.height
        }
        self.columns = columns
    }
    
    var body: some View {
        HStack (alignment: .top, spacing: spacing){
            ForEach(columns) { column in
                LazyVStack(spacing: spacing) {
                    ForEach(column.pinItems) {pinItem in
                        
                        getItemView(pinItem: pinItem)
                        Text(pinItem.imgText)
                            .multilineTextAlignment(.center)
                            .padding(.top, -5)
                    }
                }
            }
        }
        .padding(.horizontal, horizontalPadding )
    }
    func getItemView(pinItem: PinItem) -> some View {
        ZStack {
            Link(destination: URL(string: pinItem.url)!, label: {
                GeometryReader { reader in
                    Image(pinItem.imgString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                }
            })
            .frame(height: pinItem.height)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 13))
        }
    }
    
    struct Grid_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

