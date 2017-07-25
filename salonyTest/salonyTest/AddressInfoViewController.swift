//
//  AddressInfoViewController.swift
//  salonyTest
//
//  Created by Max Tymchii on 7/25/17.
//  Copyright © 2017 SambackInc. All rights reserved.
//

import Foundation
import UIKit

final class AddressInfoViewController: ViewController {
    
    fileprivate var textFields = [TextField]()
    fileprivate var textFieldConfigs = [TextFieldInfo]() {
        didSet {
            updateTextFields()
        }
    }

    fileprivate let stackView = UIStackView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        view.backgroundColor = .clear
        view.addSubview(stackView)
        stackView.align(to: view, leading: 25, trailing: 25, top: 0, bottom: 0)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        view.backgroundColor = .main
    }
    
    func setupTextFields(with configs: [TextFieldInfo]) {
        textFieldConfigs = configs
    }
    
    fileprivate func updateTextFields() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        textFieldConfigs.forEach { info in
            let textField = TextField(frame: .zero)
            textField.placeholder = info.placeholder
            textField.text = info.text
            textFields.append(textField)
            stackView.addArrangedSubview(textField)
        }
        
        textFields.last?.showLine = false
    }
}
