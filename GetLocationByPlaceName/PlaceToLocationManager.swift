//
//  PlaceToLocationManager.swift
//  GetLocationByPlaceName
//
//  Created by SomnicsAndrew on 2023/11/21.
//

import Foundation
import CoreLocation

// iOS Geocoder Inaccurate Positioning Issue
// Ref: https://infozx.gitee.io/infozx_temp/document/js/geolocation.html
class PlaceToLocationManager {
    static var shared = PlaceToLocationManager()

    func getLocation(by placeName: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(placeName) { (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                let location = placemark.location
                print("Location: \(location?.coordinate.latitude ?? 0), \(location?.coordinate.longitude ?? 0)")
            }
        }
    }
}
