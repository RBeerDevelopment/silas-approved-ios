//
//  MapViewModel.swift
//  Silas Approved Stickers
//
//  Created by Robin Beer on 31.10.21.
//

import MapKit
import CoreLocation

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 52.52001, longitude: 13.4050)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show alert")
        }
    }
    
    private func checkLoationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }

        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted (parental controls?)")
        case .denied:
            print("Go into settings to change")
        case .authorizedAlways, .authorizedWhenInUse:
            guard let location = locationManager.location else {
                break
            }
            region = MKCoordinateRegion(center: location.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLoationAuthorization()
    }
}
