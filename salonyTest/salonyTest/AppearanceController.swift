//
//  AppearanceController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit
import Rswift

/** AppearanceController struct that help you to manage appearance UI of the application.
 */
struct AppearanceController {
    func apply() {
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .main
        
        let font = Font.regularFont(size: 17)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.black,
                                             NSFontAttributeName: font]
    
        let img = UIImage()
        navigationBar.shadowImage = img
        configureBackButton()
    }
    
    private func configureBackButton() {
        let navigationBar = UINavigationBar.appearance()
        let image = R.image.back()
        navigationBar.backIndicatorTransitionMaskImage = image
        navigationBar.backIndicatorImage = image
    }
}
