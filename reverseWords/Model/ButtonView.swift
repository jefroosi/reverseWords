//
//  ButtonView.swift
//  reverseWords
//
//  Created by Елизавета Ефросинина on 03/08/2022.
//

import UIKit

@IBDesignable
class MyButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
}
