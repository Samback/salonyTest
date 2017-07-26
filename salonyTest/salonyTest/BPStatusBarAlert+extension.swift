//
//  BPStatusBarAlert+extension.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/26/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import BPStatusBarAlert

extension BPStatusBarAlert {
    static func showAlert(with message: String) {
        BPStatusBarAlert()
            .message(message: message)
            .bgColor(color: .main)
            .messageColor(color: .rgb255)
            .show()
    }
}
