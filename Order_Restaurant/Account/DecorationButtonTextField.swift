//
//  InputTextField.swift
//  Order_Restaurant
//
//  Created by Nguyen Hung on 03/10/2022.
//

import UIKit
@IBDesignable
class TextField: UITextField {
    @IBInspectable var textField: Bool = false {
        didSet {
            if textField {
                let myColor : UIColor = UIColor.lightGray
                layer.cornerRadius = 10
                layer.borderColor = myColor.cgColor
                layer.borderWidth = 1.0
                font = UIFont(name: "SFProDisplay-Regular", size: 14)
                let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
                
                func textRect(forBounds bounds: CGRect) -> CGRect {
                    let rect = super.textRect(forBounds: bounds)
                    return rect.inset(by: padding)
                }

                func editingRect(forBounds bounds: CGRect) -> CGRect {
                    let rect = super.editingRect(forBounds: bounds)
                    return rect.inset(by: padding)
                }
            }
        }
    }
}

@IBDesignable
class Button: UIButton {
    @IBInspectable var button: Bool = false {
        didSet {
            if button {
                titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 16)
                layer.cornerRadius = 10
            }
        }
    }
}
