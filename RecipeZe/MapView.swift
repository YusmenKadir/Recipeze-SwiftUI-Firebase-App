//
//  MapView.swift
//  RecipeZe
//
//  Created by Tanmay Kulkarni on 23/09/2021.
//

import Foundation // Required to access NSObjects
import MapKit
import SwiftUI

// Coordinator

class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView // Declare variable control to MapView
    
    init(_ control: MapView) { // Pass the control MapView to the intializer
        self.control = control // setup the control
    }
    
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first { // Set user location annotation
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    // Set map region zoom level
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark] // Pass the array of landmarks
    
    func makeUIView(context: Context) -> MKMapView { // Create a function and return type MKMapView
        let map = MKMapView() // Declare map as the MKMapView from the MapKit
        map.showsUserLocation = true // Set user location to 'true' to see the user's location
        map.delegate = context.coordinator // Coordinator helps in processing different MapView functions like update location
        return map
    }
    
    func makeCoordinator() -> Coordinator { // Return coordinator in the makeCoordinator function
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) { // Update the mapview and display annotation from the UI view
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}
