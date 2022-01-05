//
//  LandmarkAnnotation.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 23/09/2021.
//

import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation { // Inherit from NSObject & Observable Object
    let title: String? // Get the title as a string
    let coordinate: CLLocationCoordinate2D // Get the coordinate
    
    init(landmark: Landmark) { // Initialize the landmark
        self.title = landmark.name // Set the title
        self.coordinate = landmark.coordinate // Set the coordinate
    }
}
