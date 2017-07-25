//
//  TextFieldInfo.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

struct TextFieldInfo {
    let placeholder: String
    let text: String?
}

extension TextFieldInfo {
    static func convert(address: Address) -> [TextFieldInfo] {
        var textFieldsInfo = [TextFieldInfo]()
        
        let area = TextFieldInfo(placeholder: Messages.addressInfo.area, text: address.area)
        textFieldsInfo.append(area)
        
        let block = TextFieldInfo(placeholder: Messages.addressInfo.block, text: address.block)
        textFieldsInfo.append(block)
        
        let street = TextFieldInfo(placeholder: Messages.addressInfo.street, text: address.street)
        textFieldsInfo.append(street)
        
        let avenue = TextFieldInfo(placeholder: Messages.addressInfo.avenue, text: address.avenue)
        textFieldsInfo.append(avenue)
        
        let house = TextFieldInfo(placeholder: Messages.addressInfo.house, text: address.house)
        textFieldsInfo.append(house)
        
        let specialInstructions = TextFieldInfo(placeholder: Messages.addressInfo.specialInstructions,
                                                text: address.specialInstrcutions)
        textFieldsInfo.append(specialInstructions)
        
        let address = TextFieldInfo(placeholder: Messages.addressInfo.address, text: address.address)
        textFieldsInfo.append(address)
        
        return textFieldsInfo
    }
}
