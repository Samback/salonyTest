//
//  AddButton.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

struct AddButtonConfig {
    let backgroundColor: UIColor
    let title: String
    let titleColor: UIColor
    let font: UIFont
}

extension AddButtonConfig {
    static var defaultConfig: AddButtonConfig {
        return AddButtonConfig(backgroundColor: .white, title: "Add", titleColor: .main,
                               font: Font.boldFont(size: 14))
    }
}

/** Custom button with rounded corners and custom image. */
class AddButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        let imageSize = imageView?.image?.size ?? .zero
        let leftImageOffset = bounds.width - 12 - imageSize.width
        imageEdgeInsets = UIEdgeInsets(top: 0, left: leftImageOffset, bottom: 0, right: 0)
    }
    
    func apply(config: AddButtonConfig) {
        backgroundColor = config.backgroundColor
        let paragrapgh = NSMutableParagraphStyle()
        paragrapgh.alignment = .left
        
        let customTitle = NSAttributedString(string: config.title,
                                             attributes: [NSForegroundColorAttributeName: config.titleColor,
                                                          NSFontAttributeName: config.font,
                                                          NSParagraphStyleAttributeName: paragrapgh])
        
        setAttributedTitle(customTitle, for: .normal)
        setImage(R.image.plus_icon()?.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = config.titleColor        
    }
}
