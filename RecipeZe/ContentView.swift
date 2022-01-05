//
//  ContentView.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 22.09.21.
//

import SwiftUI
import SwiftyJSON

struct ContentView: View {
    
    
    
    var body: some View {
        
        
        
        TabView {
            RecipesView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recipes")
                }
            
            
            ExploreView()
                .tabItem {
                    Image(systemName: "rectangle.grid.2x2")
                    Text("Explore")
                }
            
            
            
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("Favourites")
                }
            
            GuidesView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Guides")
                }
            
            ShoppingView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Shopping")
                }
            
            
        }.accentColor(Color.orange)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









