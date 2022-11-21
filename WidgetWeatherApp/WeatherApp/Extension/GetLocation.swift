//
//  GetLocation.swift
//  WeatherApp
//
//  Created by Chandresh Kachariya on 18/10/22.
//  Copyright © 2022 Muhammad Osama Naeem. All rights reserved.
//

import Foundation
import CoreLocation

public class GetLocation: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationCallback: ((CLLocation?) -> Void)!
    var locationServicesEnabled = false
    var didFailWithError: Error?

    public func run(callback: @escaping (CLLocation?) -> Void) {
        locationCallback = callback
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.requestWhenInUseAuthorization()
        self.locationServicesEnabled = CLLocationManager.locationServicesEnabled()
        if self.locationServicesEnabled {
            self.manager.startUpdatingLocation()
        } else {
            self.locationCallback(nil)
        }
    }

   public func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        locationCallback(locations.last!)
        manager.stopUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        didFailWithError = error
        locationCallback(nil)
        manager.stopUpdatingLocation()
    }

    deinit {
        manager.stopUpdatingLocation()
    }
}

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}
