//
//  ShoppingView.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 26.09.21.
//

import SwiftUI
import MapKit

struct ShoppingView: View {
    
    @ObservedObject var locationManager = LocationManager() // Set location manager to the location manager class from the LocationManager file
    @State private var landmarks: [Landmark] = [Landmark]() // Pass the array of landmark through landmarks
    @State private var search: String = "Grocery Stores"
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks() {
        
        let request = MKLocalSearch.Request() // Declare search request
        request.naturalLanguageQuery = "Grocery Stores" // Set the request as a Natural Query Language pre-defined as Grocery Stores
        
        let search = MKLocalSearch(request: request) // Pass the request in the MKLocalSearch and assign it to the search value
        search.start { (response, error) in // Begin search
            if let response = response { // Check if response is valid
                
                let mapItems = response.mapItems // Return an array of MapItems
                //                print("mapItems is=>\(mapItems)")
                self.landmarks = mapItems.map  { item in // Assign the array to landmarks
                    let urlString : String
                    
                    // Perform a check if the URL is an empty string or not
                    
                    if let url = item.url
                    {
                        urlString = url.absoluteString
                    }
                    else{
                        urlString = ""
                    }
                    return Landmark(placemark: item.placemark, bizDetails: item, URL: urlString) // Pass the landmark values and return the placemark, bizDetails & URL values
                }
                
            }
            
        }
        
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        
        
        
        ZStack(alignment: .top) {
            
            // Display the map
            
            MapView(landmarks: landmarks) // Pass the landmarks through the MapView
            
            // Search bar
            
            TextField("Search", text: $search, onEditingChanged: { _ in })
            {
                
                // commit
                
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                
                // on tap
                
                self.tapped.toggle()
            }.animation(.spring())
            .offset(y: calculateOffset())
            
        }
        
        .navigationTitle("Shopping")
    }
}
