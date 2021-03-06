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

/** LocationView - main view of LocationViewController based on xib file.
 */
class LocationView: UIView {
    @IBOutlet fileprivate weak var address: UILabel!
    @IBOutlet fileprivate weak var city: UILabel!
    @IBOutlet weak var addButton: AddButton!
    @IBOutlet fileprivate weak var spinner: UIActivityIndicatorView!
    
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
        let viewName = R.nib.locationView.name
        let view: UIView = Bundle.main.loadNibNamed(viewName, owner: self, options: nil)![0] as! UIView
        addSubview(view)
        
        view.backgroundColor = .main
        view.alignAllEdges(to: self)
        
        configLabelsUI()
        configSpinnerUI()
        
        addButton.apply(config: .defaultConfig)
    }
}

extension LocationView {
    func updateUI(with address: Address?) {
        self.address.text = address?.parameters?.street ?? .ellipsis
        city.text = address?.area?.name ?? .ellipsis
    }
    
    func startSpinner() {
        spinner.alpha = 0
        spinner.startAnimating()
        spinner.isHidden = false
        
        UIView
            .animate(withDuration: 0.5, animations: { [unowned self] in
                self.addButton.alpha = 0
                self.spinner.alpha = 1.0
            }) { flag in
                if flag {
                    self.addButton.isHidden = true
                }
        }
    }
    
    func stopSpinner() {        
        addButton.alpha = 0
        addButton.isHidden = false
        
        UIView.animate(withDuration: 0.5, animations: { [unowned self] in
            self.addButton.alpha = 1
            self.spinner.alpha = 0
        }) { flag in
            if flag {
                self.spinner.isHidden = true
                self.spinner.startAnimating()
            }
        }
    }
    
    fileprivate func configSpinnerUI() {
        spinner.isHidden = true
        spinner.activityIndicatorViewStyle = .white
    }
    
    fileprivate func configLabelsUI() {
        address.font = Font.boldFont(size: 14)
        address.textColor = .rgb255
        city.font = Font.regularFont(size: 12)
        city.textColor = .rgb255
        address.text = .ellipsis
        city.text = .ellipsis
    }
}
