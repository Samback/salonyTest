//
//  PresentAddNewAddressViewControllerAction.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit


/** PresentAddNewAddressViewControllerAction - action that present add new address view controller. */
struct PresentAddNewAddressViewControllerAction {
    func execute(on navigationController: UINavigationController, with address: Address,
                 animated: Bool = true) {
        let viewController = AddNewAddressViewController.instantiate(address: address)
        navigationController.pushViewController(viewController, animated: animated)
    }
}
