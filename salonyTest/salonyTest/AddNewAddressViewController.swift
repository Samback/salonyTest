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

final class AddNewAddressViewController: ViewController {
    
    @IBOutlet fileprivate weak var mapContainer: UIView!
    @IBOutlet fileprivate weak var locationViewContainer: UIView!
    @IBOutlet weak var addressInfoContainer: UIView!
    
    fileprivate let mapViewController = GoogleMapViewController()
    fileprivate let locationViewController = CustomLocationViewController()
    
    fileprivate let addressInfoViewController = AddressInfoViewController()
    
    fileprivate var address: Address!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        attachChildViewController(mapViewController, containerView: mapContainer)
        attachChildViewController(locationViewController, containerView: locationViewContainer)
        attachChildViewController(addressInfoViewController, containerView: addressInfoContainer)
        
        let place = TextFieldInfo(placeholder: "Place ", text: "Nothing")
        let place2 = TextFieldInfo(placeholder: "Place ", text: "Nothing")
        let place3 = TextFieldInfo(placeholder: "Place ", text: "Nothing")
        
        addressInfoViewController.setupTextFields(with: [place, place2, place3])
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
