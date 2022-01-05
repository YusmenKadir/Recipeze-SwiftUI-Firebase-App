//
//  Landmark.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 23/09/2021.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    let bizDetails: MKMapItem
    let URL: String // Declare URL as string
    
    var id: UUID { // Coming from MKPlacemark
        return UUID()
    }
    
    var name: String { // Coming from MKPlacemark
        self.placemark.name ?? ""
    }
    
    var title: String { // Coming from MKPlacemark
        self.placemark.title ?? ""
    }
    
    var phoneNumber: String { // Coming from MKMapItem
        self.bizDetails.phoneNumber ?? ""
    }
    
    var url: URL { // / Coming from MKMapItem
        self.bizDetails.url!
    }
    
    var coordinate: CLLocationCoordinate2D { // Coming from MKPlacemark
        self.placemark.coordinate
    }
}
