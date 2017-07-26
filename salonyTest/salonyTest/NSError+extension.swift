//
//  NSError+extension.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation

extension NSError {
    static var zerroResults: NSError {
        return NSError.error(Messages.error.noAddressWasFound)
    }
    
    static var undefinedError: NSError {
        return NSError.error(Messages.error.undefinedError)
    }
    
    static var error: (String) -> NSError = { message in
        return NSError(domain: Bundle.main.bundleIdentifier ?? "com.my",
                       code: 200,
                       userInfo: [NSLocalizedDescriptionKey: message])
    }
}
