//
//  UIViewController+extension.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func attachChildViewController(_ childController: UIViewController, containerView: UIView) {
        addChildViewController(childController)
        childController.view.frame = containerView.bounds
        containerView.addSubview(childController.view)
        childController.didMove(toParentViewController: self)
    }
    
    public func detachChildViewController(_ childController: UIViewController) {
        if childViewControllers.contains(childController) {
            childController.willMove(toParentViewController: nil)
            childController.view.removeFromSuperview()
            childController.removeFromParentViewController()
        }
    }
}
