//
//  Area.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

struct Area {
    let name: String?
    let id: Int?
}

extension Area {
    init(json: JSONDictionary) {
        name = json["name"] as? String
        id = json["id"] as? Int
    }
}
