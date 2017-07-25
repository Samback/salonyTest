//
//  CustomLocationViewController
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

class CustomLocationViewController: ViewController {
    
    var locationView: LocationView!
    var tapAction: SimpleCompletion?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        locationView = LocationView()
        view.addSubview(locationView)
        locationView.alignAllEdges(to: view)
        locationView.addButton.addTarget(self, action: #selector(tapOnAddButton), for: .touchUpInside)
    }
    
    dynamic func tapOnAddButton() {
        tapAction?()
    }

}
