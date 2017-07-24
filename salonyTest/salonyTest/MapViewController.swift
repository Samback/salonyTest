//
//  MapViewController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit
import Rswift

final class MapViewController: ParentViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        title = "Add new address"
    }
}

extension MapViewController {
    class func instantiate() -> MapViewController {
        guard let mapView = R.storyboard.main.mapViewController() else {
            fatalError("Something really bed with instantiating of view controller MapViewController")
        }
        
        return mapView
    }
}
