//
//  BookListViewController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import Foundation
import UIKit

final class BookListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "購入済み"
        if let _ = self.navigationController as? CustomeNavigationController {
            print("true")
        } else {
            print("false")
        }
        navigationItem.setRightButton(title: Const.ADD_BUTTON_LABEL, style: .plain, target: self, action: #selector(tappedRightButton(_:)))
    }
    
    @objc func tappedRightButton(_ sender: AnyObject) {
        print("tappedRightButton")
        
        if let barCodeReaderViewController = R.storyboard.barCodeReader.instantiateInitialViewController() {
            barCodeReaderViewController.modalPresentationStyle = .fullScreen
            
            self.navigationController?.present(barCodeReaderViewController, animated: true, completion: nil)
        }
        
        
    }
}
