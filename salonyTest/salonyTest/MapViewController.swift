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
import GoogleMaps

final class MapViewController: ViewController {
    
    @IBOutlet weak var mapContainer: UIView!
    @IBOutlet weak var locationView: UIView!
    
    let mapViewController = GoogleMapViewController()
    let locationViewController = CustomLocationViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configMap()
    }
    
    private func configUI() {
        title = Messages.title.myAddress
    }
    
    private func configMap() {
        mapViewController.mapCenterHandler = { position in
            print("New position \(position.target)")
        }
        
        locationViewController.tapAction = {[unowned self] in
            guard let navigationController = self.navigationController else {
                return
            }
            PresentAddNewAddressViewControllerAction().execute(on: navigationController, with: Address())
        }
        
        attachChildViewController(mapViewController, containerView: mapContainer)
        
        attachChildViewController(locationViewController, containerView: locationView)
        
    }
}

extension MapViewController {
    class func instantiate() -> MapViewController {
        guard let mapView = R.storyboard.main.mapViewController() else {
            fatalError(Messages.error.mapViewController)
        }
        
        return mapView
    }
}
