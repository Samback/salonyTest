//
//  AddNewAddressViewController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit
import Rswift
import IQKeyboardManagerSwift
import GoogleMaps

final class AddNewAddressViewController: ViewController {
    
    @IBOutlet fileprivate weak var mapContainer: UIView!
    @IBOutlet fileprivate weak var locationViewContainer: UIView!
    @IBOutlet weak var addressInfoContainer: UIView!
    
    fileprivate lazy var mapViewController: GoogleMapViewController = {
        let cameraPosition = GMSCameraPosition(target: self.address.coordinate, zoom: 16, bearing: 0, viewingAngle: 0)
        let mapViewController = GoogleMapViewController(position: cameraPosition)
        
        return mapViewController
    }()
    
    fileprivate lazy var locationViewController: CustomLocationViewController = {
        let locationViewController = CustomLocationViewController()
        locationViewController.updateUI(with: self.address)
        
        return locationViewController
    }()
    
    @IBOutlet weak var textFieldsHeight: NSLayoutConstraint!
    fileprivate let addressInfoViewController = AddressInfoViewController()
    
    fileprivate var address: Address!
    
    var returnKeyHandler: IQKeyboardReturnKeyHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        returnKeyHandler = IQKeyboardReturnKeyHandler.init(controller: self)
    }
    
    private func configUI() {
        baseUI()
        attachControllers()
        configFields()
    }
    
    private func baseUI() {
        title = Messages.title.addNewAddress
        view.backgroundColor = .main
    }
    
    private func attachControllers() {
        attachChildViewController(mapViewController, containerView: mapContainer)
        mapViewController.view.isUserInteractionEnabled = false
        attachChildViewController(locationViewController, containerView: locationViewContainer)
        attachChildViewController(addressInfoViewController, containerView: addressInfoContainer)
    }
    
    private func configFields() {
        let fieldsInfo = TextFieldInfo.convert(address: address)
        textFieldsHeight.constant = CGFloat(fieldsInfo.count) * TextField.hight
        addressInfoViewController.setupTextFields(with: fieldsInfo)
    }
    
    deinit {
        returnKeyHandler = nil
    }
    
}

extension AddNewAddressViewController {
    class func instantiate(address: Address) -> AddNewAddressViewController {
        guard let viewController = R.storyboard.main.addNewAddressViewController() else {
            fatalError(Messages.error.addNewAddressViewController)
        }
        
        viewController.address = address
        
        return viewController
    }
}
