//
//  AppDelegate.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import UIKit
import GoogleMaps
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        guard let window = window else {
            return false
        }
        
        initalConfigs()
        PresentMapViewControllerAction().execute(at: window)
        
        return true
    }

    fileprivate func initalConfigs() {
        guard GMSServices.provideAPIKey(Credentials.googleMaps) else {
            fatalError("Maps are not registered!")
        }
        
        IQKeyboardManager.sharedManager().enable = true
        AppearanceController().apply()
    }
    
}
