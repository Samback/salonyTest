//
//  String+extension.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

extension String {
    func convertToJSONDictionary() -> JSONDictionary? {
        if let data = data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
}
