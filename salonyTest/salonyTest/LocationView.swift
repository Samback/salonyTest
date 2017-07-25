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
    @IBOutlet weak var addButton: AddButton!
    
    var tapAction: SimpleCompletion?
    
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
        addSubview(view)
        
        view.backgroundColor = .main
        view.alignAllEdges(to: self)
        configLabelsUI()
        addButton.apply(config: .defaultConfig)
    }
    
    func updateUI(with address: Address) {
        self.address.text = address.street ?? "…"
        city.text = address.area ?? "…"
    }
    
    private func configLabelsUI() {
        address.font = Font.boldFont(size: .p14)
        address.textColor = .rgb255
        city.font = Font.regularFont(size: .p12)
        city.textColor = .rgb255
        
        address.text = "…"
        city.text = "…"
    }
}
