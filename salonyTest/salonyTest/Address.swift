//
//  Address.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import CoreLocation

/** Main address model */
struct Address {
    let coordinate: CLLocationCoordinate2D
    let area: Area?
    let parameters: AddressParameters?
    let specialInstrcutions: String? = nil
    let preview: String?
}

extension Address {
    init?(json: JSONDictionary) {
        
        if json.keys.count == 0 {
            return nil
        }
        
        guard
            let lat = json["lat"] as? String,
            let lng = json["lng"] as? String,
            let latitude = Double(lat),
            let longitude = Double(lng) else {
                return nil
        }
        
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        if let areaDictionary = json["area"] as? JSONDictionary {
            area = Area(json: areaDictionary)
        } else {
            area = nil
        }
        
        if let addressParameters = json["address_params"] as? JSONDictionary {
            parameters = AddressParameters(json: addressParameters)
        } else {
            parameters = nil
        }
        
        preview = json["preview"] as? String
    }
}

extension Address {
    init (coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        area = nil
        preview = nil
        parameters = nil
    }
}
