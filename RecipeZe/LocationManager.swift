
//
//  LocationManager.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 23/09/2021.
//

import Foundation // Required to access NSObjects
import MapKit

class LocationManager: NSObject, ObservableObject { // Inherit from NSObject & Observable Object
    
    private let locationManager = CLLocationManager() // declare the location manager to CLLocationManager
    @Published var location: CLLocation? = nil // Get the location value
    
    override init() {
        
        // Set the location manager
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization() // Ask for user permission
        self.locationManager.startUpdatingLocation()
        
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    // Print status if the location manager authorization is changed
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    // Updated location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        // Assign updated location
        
        self.location = location
    }
    
}
