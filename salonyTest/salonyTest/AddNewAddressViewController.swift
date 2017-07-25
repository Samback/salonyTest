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
    @IBOutlet fileprivate weak var locationView: UIView!
    
    fileprivate let mapViewController = GoogleMapViewController()
    fileprivate let locationViewController = CustomLocationViewController()
    
    fileprivate var address: Address!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        attachChildViewController(mapViewController, containerView: mapContainer)
        attachChildViewController(locationViewController, containerView: locationView)
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
