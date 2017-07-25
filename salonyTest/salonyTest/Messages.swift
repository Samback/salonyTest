//
//  Messages.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

struct Messages {
    static let title = Title()
    static let error = ErrorMessage()
    static let addressInfo = AddressInfo()
}

struct Title {
    let myAddress = "My Address"
    let addNewAddress = "Add new address"
}

struct AddressInfo {
    let area = "Area"
    let block = "Block"
    let street = "Street"
    let avenue = "Avenue/Lane"
    let house = "House/Building"
    let specialInstructions = "Special instructions"
    let address = "Address"
}

struct ErrorMessage {
   let mapViewController = "Something really bad with instantiating of view controller MapViewController"
    let addNewAddressViewController = "Something really bad with instantiating of view controller AddNewAddressViewController"
}
