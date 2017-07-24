//
//  Font.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

typealias Font = UIFont

extension Font {
    
    public enum FontSize: CGFloat {
        case p10 = 10.0
        case p11 = 11.0
        case p12 = 12.0
        case p13 = 13.0
        case p14 = 14.0
        case p15 = 15.0
        case p16 = 16.0
        case p17 = 17.0
        case p18 = 18.0
        case p20 = 20.0
        case p22 = 22.0
        case p24 = 24.0
        case p25 = 25.0
        case p26 = 26.0
        case p32 = 32.0
        case p33 = 33.0
        case p42 = 42.0
    }
    
    public static func regularFont(size: FontSize) -> UIFont {
        return UIFont.systemFont(ofSize: size.rawValue)
    }    

}
