//
//  UIView+extension.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/24/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func alignAllEdges(to container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        //constraints help view to take whole space of the container
        let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container,
                                         attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container,
                                          attribute: .trailing, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container,
                                     attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                                        toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        container.addConstraints([leading, trailing, top, bottom])
    }
    
    public func align(to container: UIView, leading: CGFloat = 0, trailing: CGFloat = 0, top: CGFloat = 0,
                      bottom: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container,
                                         attribute: .leading, multiplier: 1.0, constant: leading)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container,
                                          attribute: .trailing, multiplier: 1.0, constant: -trailing)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container,
                                     attribute: .top, multiplier: 1.0, constant: top)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal,
                                        toItem: container, attribute: .bottom, multiplier: 1.0, constant: -bottom)
        
        container.addConstraints([leading, trailing, top, bottom])
    }
}
