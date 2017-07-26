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
import BPStatusBarAlert

/** MapViewController - view controller that helps user find location that he want to add as new address. */  
final class MapViewController: ViewController {
    
    @IBOutlet weak var mapContainer: UIView!
    @IBOutlet weak var locationView: UIView!
    
    let mapViewController = GoogleMapViewController(position: .defaultPosition)
    let locationViewController = CustomLocationViewController()
    
    fileprivate var currentAddress: Address?
    fileprivate var currentPosition = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    fileprivate var inputAddress: Address {
        if let currentAddress = currentAddress {
            return currentAddress
        } else {
            return Address(coordinate: currentPosition)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configControllers()
    }
    
    private func configUI() {
        title = Messages.title.myAddress
    }
    
    private func configControllers() {
        mapViewController.mapCenterHandler = { position in
            DispatchQueue.main.async { [unowned self] in
                self.locationViewController.startSpinner()
            }
            self.currentPosition = position.target
            FetchAddressInfoController().address(with: position.target) { address, error in
                DispatchQueue.main.async { [unowned self] in
                    self.updateUI(with: address, error: error)
                }
            }
        }
        
        locationViewController.tapAction = {[unowned self] in
            guard let navigationController = self.navigationController else {
                return
            }
            
            PresentAddNewAddressViewControllerAction()
                .execute(on: navigationController,
                         with: self.inputAddress)
        }
        
        attachChildViewController(mapViewController, containerView: mapContainer)
        attachChildViewController(locationViewController, containerView: locationView)
    }
    
    private func updateUI(with address: Address?, error: NSError?) {
        currentAddress = address
        locationViewController.updateUI(with: address)
        locationViewController.stopSpinner()
        
        if let error = error {
            BPStatusBarAlert.showAlert(with: error.localizedDescription)
        }
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
