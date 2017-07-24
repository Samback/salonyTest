//
//  Color.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

typealias Color = UIColor
private let n: CGFloat = 255.0

extension Color {
    
    static var rgb1583098: UIColor {
        return color(158, green: 30, blue: 98, alpha: 1.0)
    }
    
    //Main color
    static var main: UIColor {
        return Color.rgb1583098
    }
    
    //Gray color
    static var rgb172180190: UIColor {
        return color(172, green: 180, blue: 190, alpha: 1.0)
    }
    
    //Green color
    static var rgd30158149: UIColor {
        return color(30, green: 158, blue: 149, alpha: 1.0)
    }    
    
    //Color convertor
    static func color(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red / n, green: green / n, blue: blue / n, alpha: alpha)
    }
}
