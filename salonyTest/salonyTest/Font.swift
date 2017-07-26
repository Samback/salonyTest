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
    
    public static func boldFont(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
    
    public static func regularFont(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }    

}
