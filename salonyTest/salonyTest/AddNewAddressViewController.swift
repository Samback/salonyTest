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

final class AddNewAddressViewController: ViewController {
    
    @IBOutlet fileprivate weak var mapContainer: UIView!
    @IBOutlet fileprivate weak var locationViewContainer: UIView!
    @IBOutlet weak var addressInfoContainer: UIView!
    
    fileprivate let mapViewController = GoogleMapViewController()
    fileprivate let locationViewController = CustomLocationViewController()
    
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
        title = Messages.title.addNewAddress
        attachChildViewController(mapViewController, containerView: mapContainer)
        attachChildViewController(locationViewController, containerView: locationViewContainer)
        attachChildViewController(addressInfoViewController, containerView: addressInfoContainer)
        view.backgroundColor = .main
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
