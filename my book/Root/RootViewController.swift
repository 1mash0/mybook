//
//  RootViewController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import UIKit

final class RootViewController: UIViewController {
    // 現在表示しているViewController
    private var currentViewController: UIViewController = UIViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        // 起動時の画面はSplashViewController
        guard let splashViewController = R.storyboard.splash.instantiateInitialViewController() else { return }
        currentViewController = splashViewController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(currentViewController)
        currentViewController.view.frame = view.bounds
        view.addSubview(currentViewController.view)
        currentViewController.didMove(toParent: self)
    }
    
    func transition(to viewController: UIViewController) {
        // 新しいViewControllerを追加
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        // 現在のViewControllerを削除する準備
        currentViewController.willMove(toParent: nil)
        
        // Superviewから現在のViewを削除
        currentViewController.view.removeFromSuperview()
        
        // RootViewControllerから現在のViewControllerを削除
        currentViewController.removeFromParent()
        
        // 現在のViewControllerを更新
        currentViewController = viewController
    }
    
    // 移動したいViewControllerごとに用意しておくと簡単に使用できる
    func transitionToMain() {
        // 切り替えたい先のViewControllerを用意
//        if let viewController = R.storyboard.main.instantiateInitialViewController() {
//            transition(to: viewController)
//        }
//        if let mainViewController = R.storyboard.main.instantiateInitialViewController() {
//            let navi = UINavigationController(rootViewController: mainViewController)
//            navi.modalPresentationStyle = .fullScreen
//            present(navi, animated: false)
//        }
    }
}
