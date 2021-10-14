//
//  UILabel+Extend.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import UIKit

@IBDesignable
final class PaddingLabel: UILabel {
    @IBInspectable var topPadding: CGFloat = 0
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    @IBInspectable var bottomPadding: CGFloat = 0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: rect.inset(by: insets))
    }
}
