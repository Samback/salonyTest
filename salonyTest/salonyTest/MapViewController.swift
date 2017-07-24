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
        let defaultPosition = GMSCameraPosition.camera(withLatitude: 29.364813, longitude: 47.982395, zoom: 20.0)
        mapView = GMSMapView()
        mapView.animate(to: defaultPosition)
        mapContainer.insertSubview(mapView, at: 0)
        mapView.alignAllEdges(to: mapContainer)
        mapView.delegate = self
    }
    
    private func configUI() {
        title = "My Address"
    }
}

extension MapViewController: GMSMapViewDelegate {
    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("Center \(position.target)")
    }
}

extension MapViewController {
    class func instantiate() -> MapViewController {
        guard let mapView = R.storyboard.main.mapViewController() else {
            fatalError("Something really bad with instantiating of view controller MapViewController")
        }
        
        return mapView
    }
}
