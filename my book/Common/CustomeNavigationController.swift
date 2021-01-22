//
//  CustomeNavigationController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import UIKit

final class CustomeNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UINavigationItem {
    func setRightButton(title: String, style: UIBarButtonItem.Style, target: Any?, action: Selector) {
        self.rightBarButtonItem = UIBarButtonItem(title: title, style: style, target: target, action: action)
    }
}
