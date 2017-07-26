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
    var position: GMSCameraPosition!
    
    init(position: GMSCameraPosition) {
        super.init(nibName: nil, bundle: nil)        
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMap()
        configPin()
    }
    
    private func configMap() {
        mapView = GMSMapView()
        mapView.animate(to: position)
        view.insertSubview(mapView, at: 0)
        mapView.alignAllEdges(to: view)
        mapView.delegate = self
    }
    
    private func configPin() {
        view.addSubview(pinImage)
        pinImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint
            .activate([pinImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                       pinImage.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                         constant: -pinImage.bounds.height / 2)
            ])
    }
}

extension GoogleMapViewController: GMSMapViewDelegate {
    public func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        mapCenterHandler?(position)
    }
}
