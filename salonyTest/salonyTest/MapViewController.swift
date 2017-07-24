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
    fileprivate var mapView: GMSMapView!
    @IBOutlet weak var locationView: LocationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configMap()
    }
    
    private func configMap() {
        mapView = GMSMapView()
        mapView.animate(to: .defaultPosition)
        mapContainer.insertSubview(mapView, at: 0)
        mapView.alignAllEdges(to: mapContainer)
        mapView.delegate = self
    }
    
    private func configUI() {
        title = Messages.title.myAddress
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
            fatalError(Messages.error.mapViewController)
        }
        
        return mapView
    }
}
