//
//  WebController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

struct WebController {
    static let baseURL = "http://staging.salony.com/"
    static let version = "v6"
    static let path = baseURL + version
    static let geolocate = path + "/addresses/geolocate"
}
