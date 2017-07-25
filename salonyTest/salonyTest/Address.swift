//
//  Address.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import CoreLocation

struct Address {
    let coordinate: CLLocationCoordinate2D
    let area: String?
    let block: String?
    let street: String?
    let avenue: String?
    let house: String?
    let specialInstrcutions: String?
    let address: String?
}

extension Address {
    init (coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        area = nil
        block = nil
        street = nil
        avenue = nil
        house = nil
        specialInstrcutions = nil
        address = nil
    }
}
