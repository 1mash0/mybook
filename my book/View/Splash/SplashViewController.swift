//
//  SplashViewController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import UIKit

final class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let bookListViewController = R.storyboard.bookList.instantiateInitialViewController() {
            let navi = CustomeNavigationController(rootViewController: bookListViewController)
            navi.modalPresentationStyle = .fullScreen
            
            present(navi, animated: false)
        }
    }
}
