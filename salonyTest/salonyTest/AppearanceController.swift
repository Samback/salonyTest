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

struct AppearanceController {
    func apply() {
        
    }
    
    private func applyAppearanceForNavigationBar() {
        self.configurebackButton()
        self.configureTitle()
    }
    
    private func configureTitle() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = Color.rgb1583098
        navigationBar.tintColor = .white
        
        let font = Font.regularFont(size: .p18)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                             NSFontAttributeName: font]
        
        let img = UIImage()
        navigationBar.shadowImage = img
    }
    
    private func configurebackButton() {
        let navigationBar = UINavigationBar.appearance()
        
        let image = R.image.back()
        navigationBar.backIndicatorTransitionMaskImage = image
        navigationBar.backIndicatorImage = image
    }

}
