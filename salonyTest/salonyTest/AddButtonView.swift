//
//  AddButtonView.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

class AddButtonView: UIView {
    
    var tapAction: (() -> Void)?
    let actionButton = AddButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        self.addSubview(actionButton)
        actionButton.alignAllEdges(to: self)        
        actionButton.apply(config: .defaultConfig)
        actionButton
            .addTarget(self, action: #selector(touchButton), for: .touchUpInside)
    }
    
    dynamic func touchButton() {
        tapAction?()
    }
}
