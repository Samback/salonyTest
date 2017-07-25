//
//  TextField.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import JVFloatLabeledTextField

class TextField: JVFloatLabeledTextField {
    
    fileprivate let line = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
   override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        let layerFrame = layer.frame
        line.frame = CGRect(x: layerFrame.minX, y: layerFrame.maxY - 1, width: layerFrame.maxX, height: 1)
    }
    
    fileprivate func commonInit() {
        floatingLabelFont = Font.regularFont(size: .p10)
        floatingLabelTextColor = Color.rgb255.withAlphaComponent(0.5)
        floatingLabelActiveTextColor = Color.rgb255
        placeholderColor = Color.rgb255
        textColor = Color.rgb255
        
        line.borderColor = Color.rgb255.withAlphaComponent(0.3).cgColor
        line.borderWidth = 1.0
        layer.addSublayer(line)
    }
}
