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
        applyAppearanceForNavigationBar()
    }
    
    private func applyAppearanceForNavigationBar() {
        configurebackButton()
        configureTitle()
    }
    
    private func configureTitle() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = .white
        navigationBar.tintColor = .black
        
        let font = Font.regularFont(size: .p17)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Color.black,
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
