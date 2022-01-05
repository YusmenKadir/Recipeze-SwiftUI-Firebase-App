
//
//  GuidesView.swift
//  PicGrid
//
//  Created by Wolfgang Rufaro Voigt on 24/09/2021.
//

import SwiftUI

struct GuidesView: View {
    
    //this is where the pictures/cards are populated
    let pinItems = [
        PinItem(height: 250, imgString: "image", imgText: "How to Dice and Cut Onions Without Crying", url: "https://www.missinformationblog.com/how-to-cut-onions-without-crying/"),
        PinItem(height: 90, imgString: "image2", imgText: "7 Secret Kitchen Hacks of Restaurant Chefs", url: "https://recipes.net/articles/7-secret-kitchen-hacks-of-restaurant-chefs/"),
        PinItem(height: 287, imgString: "image3", imgText: "How To Make Perfect Mashed Potatoes", url: "https://www.southernliving.com/food/how-to/how-to-make-perfect-mashed-potatoes"),
        PinItem(height: 157, imgString: "image4", imgText: "Our Favorite Pins Of The Week: Small Kitchen Hacks", url: "https://porch.com/advice/favorite-pins-week-small-kitchen-hacks"),
        PinItem(height: 234, imgString: "image6", imgText: "From Our Kitchen: Spring for Flavor",url:"https://www.southernliving.com/food/how-to/from-our-kitchen-spring-flavor"),
        PinItem(height: 182, imgString: "image12", imgText: "Quick and Easy Bolognese Sauce", url: "https://www.simplyrecipes.com/recipes/quick_bolognese_sauce/"),
        PinItem(height: 225, imgString: "image10", imgText: "Grilled Sweet Potatoes", url: "https://www.simplyrecipes.com/recipes/grilled_sweet_potatoes/"),
        PinItem(height: 100, imgString: "image5", imgText: "Super Organized Grocery List Cuts My Shopping Time in Half", url: "https://www.southernliving.com/how-to/how-to-organize-grocery-list"),
        PinItem(height: 269, imgString: "image7", imgText: "Grandma’s Goulash", url: "https://www.simplystacie.net/grandmas-goulash/"),
        PinItem(height: 95, imgString: "image9", imgText: "15 Easy Kitchen Hacks to Help You Cook Better Than a Pro", url: "https://brightside.me/creativity-cooking/15-easy-kitchen-hacks-to-help-you-cook-better-than-a-pro-723610/"),
        PinItem(height: 170, imgString: "image8", imgText: "Air Fryer Pizza Buns Recipe", url: "https://www.simplystacie.net/air-fryer-pizza-buns-recipe/"),
        PinItem(height: 120, imgString: "image11", imgText: "Shrimp Fried Rice", url: "https://www.simplyrecipes.com/recipes/shrimp_fried_rice/"),
    ]
    
    @State private var columns = 2
    
    var body: some View {
        NavigationView {
            ScrollView {
                PinGrid(pinItems: pinItems, numOfColumns: columns,
                        spacing: 13, horizontalPadding: 10)
            }
            .navigationBarItems(leading: zoomInBtn, trailing: zoomOutBtn)
            .navigationTitle("Guides")
        }
    }
    
    var zoomInBtn: some View {
        Button(action:{
            columns -= 1
        })
        {
            Image(systemName: "plus.magnifyingglass").foregroundColor(Color.orange)
                .font(.system(size: 20.0, weight: .bold))
            
        }
        .disabled(columns == 1)
    }
    var zoomOutBtn: some View {
        Button(action:{
            columns += 1
        })
        {
            Image(systemName: "minus.magnifyingglass").foregroundColor(Color.orange)
                .font(.system(size: 20.0, weight: .bold))
        }
        .disabled(columns == 3)
    }
    
}



