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

/** TextFieldProvider - helper struct that provide array of TextFieldInfo based on fetched address.*/
struct TextFieldProvider {
    static func convert(address: Address) -> [TextFieldInfo] {
        var textFieldsInfo = [TextFieldInfo]()
        
        let area = TextFieldInfo(placeholder: Messages.addressInfo.area, text: address.area?.name)
        textFieldsInfo.append(area)
        
        let block = TextFieldInfo(placeholder: Messages.addressInfo.block, text: address.parameters?.block)
        textFieldsInfo.append(block)
        
        let street = TextFieldInfo(placeholder: Messages.addressInfo.street, text: address.parameters?.street)
        textFieldsInfo.append(street)
        
        let avenue = TextFieldInfo(placeholder: Messages.addressInfo.avenue, text: address.parameters?.avenue)
        textFieldsInfo.append(avenue)
        
        let house = TextFieldInfo(placeholder: Messages.addressInfo.house, text: address.parameters?.building)
        textFieldsInfo.append(house)
        
        let specialInstructions = TextFieldInfo(placeholder: Messages.addressInfo.specialInstructions,
                                                text: address.specialInstrcutions)
        textFieldsInfo.append(specialInstructions)
        
        let address = TextFieldInfo(placeholder: Messages.addressInfo.address, text: address.parameters?.street)
        textFieldsInfo.append(address)
        
        return textFieldsInfo
    }
}
