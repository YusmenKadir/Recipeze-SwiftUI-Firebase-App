//
//  PlaceListView.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 23/09/2021.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark] // Pass the array of Landmark through landmarks
    var onTap: () -> () // Declare ontap gesture as empty
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("View All  ") + Text(Image(systemName: "chevron.up"))
                EmptyView() // Set an empty view
            }.frame(width: UIScreen.main.bounds.size.width, height: 60) // Declare the width of the frame of the UI screen
            .gesture(TapGesture()
                        .onEnded(self.onTap) // Call the ontap gesture
            )
            
            List { // Show the list of addresses in a list view
                
                ForEach(self.landmarks, id: \.id) { landmark in // Fetch landmark id from landmark and display the below  landmark attributes in a VStack
                    
                    VStack(alignment: .leading) {
                        Text(landmark.name) // Display landmark name in bold
                            .fontWeight(.bold)
                        Text(landmark.title) // Display landmark address
                        Text(landmark.phoneNumber) // Display landmark phone number
                        Text(landmark.URL).foregroundColor(Color.blue) // Display landmark URL
                        
                    }
                }
                
            }.animation(nil)
            
        }.cornerRadius(10)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        //        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
        //        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark(),bizDetails: MKMapItem())], onTap: {})
        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark(),bizDetails: MKMapItem(), URL: String())], onTap: {}) // Pass the list of landmarks through the place list view
    }
}
