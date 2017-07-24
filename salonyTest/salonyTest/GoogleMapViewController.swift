//
//  GoogleMapViewController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

final class GoogleMapViewController: ViewController {
    fileprivate var mapView: GMSMapView!
    fileprivate let pinImage = UIImageView(image: R.image.pin())
    var mapCenterHandler: ((GMSCameraPosition) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMap()
        configPin()
    }
    
    private func configMap() {
        mapView = GMSMapView()
        mapView.animate(to: .defaultPosition)
        view.insertSubview(mapView, at: 0)
        mapView.alignAllEdges(to: view)
        mapView.delegate = self
    }
    
    private func configPin() {
        view.addSubview(pinImage)
        pinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate([pinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                       pinImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
}

extension GoogleMapViewController: GMSMapViewDelegate {
    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("Center \(position.target)")
    }
}
