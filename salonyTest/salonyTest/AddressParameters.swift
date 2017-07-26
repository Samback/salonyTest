//
//  AddressParameters.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

struct AddressParameters {
    let avenue: String?
    let block: String?
    let building: String?
    let province: String?
    let street: String?
}

extension AddressParameters {
    init(json: JSONDictionary) {
        avenue = json["avenu"] as? String
        block = json["block"] as? String
        building = json["building"] as? String
        province = json["province"] as? String
        street = json["street"] as? String
    }
}
