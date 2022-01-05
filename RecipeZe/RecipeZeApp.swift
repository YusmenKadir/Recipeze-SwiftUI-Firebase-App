//
//  RecipeZeApp.swift
//  RecipeZe
//
//  Created by Yusmen Kadir on 22.09.21.
//

import SwiftUI
import Firebase

@main
struct RecipeZeApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

