//
//  PresentMapViewControllerAction.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

struct PresentMapViewControllerAction {
    func execute(at window: UIWindow) {
        let mapViewController = MapViewController.instantiate()
        let navController = UINavigationController(rootViewController: mapViewController)
        window.rootViewController = navController
    }
}
