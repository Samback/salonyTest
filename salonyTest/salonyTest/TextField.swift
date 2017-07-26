//
//  TextField.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import JVFloatLabeledTextField


/** TextField - inherited class with custom config of JVFloatLabeledTextField. */
class TextField: JVFloatLabeledTextField {
    
    static let hight: CGFloat = 44.0
    fileprivate let line = UIView()
    var showLine: Bool = true {
        didSet {
            line.isHidden = !showLine
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        line.frame = CGRect(x: bounds.minX, y: bounds.maxY - 1, width: bounds.maxX, height: 1)
    }
    
    fileprivate func commonInit() {
        configLineUI()
        configFieldUI()
    }
}

extension TextField {    
    fileprivate func configLineUI() {
        line.backgroundColor = Color.rgb255.withAlphaComponent(0.5)
        addSubview(line)
    }
    
    fileprivate func configFieldUI() {
        floatingLabelFont = Font.regularFont(size: .p10)
        floatingLabelTextColor = Color.rgb255.withAlphaComponent(0.5)
        floatingLabelActiveTextColor = Color.rgb255
        floatingLabelYPadding = 4
        placeholderColor = Color.rgb255
        textColor = Color.rgb255
        tintColor = .rgb255
    }
}
