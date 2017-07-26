//
//  FetchAddressInfoController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

/**
 Helper structure to manage networking connection with server side and fetch address info via geolocation data.
 */
struct FetchAddressInfoController {
    func address(with location: CLLocationCoordinate2D, completion: @escaping AddressCompletion) {
        let parameters = ["lat": location.latitude,
                          "lng": location.longitude]
        Alamofire
            .request(WebController.geolocate, method: .get, parameters: parameters)
            .responseJSON { response in
                if let error = response.error {
                    completion(nil, NSError.error(message: error.localizedDescription))
                }
                
                guard let json = response.result.value as? JSONDictionary else {
                    completion(nil, .undefinedError)
                    return
                }
                
                if let addressJSON = json["address"] as? JSONDictionary,
                    let address = Address(json: addressJSON) {
                    completion(address, nil)
                } else {
                    completion(nil, .zerroResults)
                }
        }        
    }
}
