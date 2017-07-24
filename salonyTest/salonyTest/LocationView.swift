//
//  LocationView.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit
import Rswift

class LocationView: UIView {
    @IBOutlet fileprivate weak var address: UILabel!
    @IBOutlet fileprivate weak var city: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        let viewName = "LocationView"
        let view: UIView = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        
        view.backgroundColor = .main
        view.alignAllEdges(to: self)
        
        configLabelsUI()
        
    }
    
    private func configLabelsUI() {
        address.font = Font.boldFont(size: .p14)
        address.textColor = .rgb255
        city.font = Font.regularFont(size: .p12)
        city.textColor = .rgb255
        
        address.text = "Jobova street"
        city.text = "Kuwait"
    }
}
