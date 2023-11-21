//
//  PlaceToLocationManager.swift
//  GetLocationByPlaceName
//
//  Created by SomnicsAndrew on 2023/11/21.
//

import Foundation
import CoreLocation
import GooglePlaces

// iOS Geocoder Inaccurate Positioning Issue
// Ref: https://infozx.gitee.io/infozx_temp/document/js/geolocation.html
class PlaceToLocationManager {
    static var shared = PlaceToLocationManager()
    var placesClient = GMSPlacesClient.shared()

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

    func searchPlaceByGoogleSDK(name: String) {
        let filter = GMSAutocompleteFilter()

        placesClient.findAutocompletePredictions(fromQuery: name, filter: filter, sessionToken: nil) { (results, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let results = results {
                for result in results {
                    self.getPlaceDetails(placeID: result.placeID)
                }
            }
        }
    }

    func getPlaceDetails(placeID: String) {
        placesClient.lookUpPlaceID(placeID, callback: { (place, error) -> Void in
            if let error = error {
                print("Lookup place id query error: \(error.localizedDescription)")
                return
            }

            if let place = place {
                print("Place name \(place.name)")
                print("Place address \(place.formattedAddress)")
                print("Place lat \(place.coordinate.latitude) lon \(place.coordinate.longitude)")
            }
        })
    }
}
