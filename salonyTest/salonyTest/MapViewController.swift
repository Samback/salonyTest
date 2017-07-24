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

final class MapViewController: ParentViewController {
    
    @IBOutlet weak var mapContainer: UIView!
    fileprivate var mapView: GMSMapView!
    @IBOutlet weak var locationView: LocationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configMap()
    }
    
    private func configMap() {
        let defaultPosition = GMSCameraPosition.camera(withLatitude: 29.364813, longitude: 47.982395, zoom: 18.0)
        mapView = GMSMapView()
        mapView.animate(to: defaultPosition)
        mapContainer.addSubview(mapView)
        mapView.alignAllEdges(to: mapContainer)
    }
    
    private func configUI() {
        title = "My Address"
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
