//
//  TintOverlay.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 28.09.21.
//

import Foundation
import SwiftUI


struct TintOverlay: View {
    var name:String?
    
    init(mealName:String){
        self.name = mealName
    }
    var body: some View {
        ZStack {
            Text("\(name!)")
                .foregroundColor(Color.white)
                .fontWeight(.bold).font(.system(size: 25)).font(.title).zIndex(100)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
    }
}
