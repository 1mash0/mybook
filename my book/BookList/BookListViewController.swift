//
//  BookListViewController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import Foundation
import UIKit

final class BookListViewController: UIViewController {
    let viewModel = BookListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "購入済み"
        if let _ = self.navigationController as? CustomeNavigationController {
            print("true")
        } else {
            print("false")
        }
        
        setupTableView()
        viewModel.setBookListRows()
        
        navigationItem.setRightButton(title: Const.ADD_BUTTON_LABEL, style: .plain, target: self, action: #selector(tappedRightButton(_:)))
    }
    
    @objc func tappedRightButton(_ sender: AnyObject) {
        print("tappedRightButton")
        
        if let barCodeReaderViewController = R.storyboard.barCodeReader.instantiateInitialViewController() {
            barCodeReaderViewController.modalPresentationStyle = .fullScreen
            
            self.navigationController?.present(barCodeReaderViewController, animated: true, completion: nil)
        }
    }
    
    /// テーブルビューのセットアップ
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        
        tableView.register(R.nib.bookListCustomCell)
    }
}

extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124.0
    }
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.bookListCustomCell, for: indexPath) else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        
        let data = viewModel.getBookListRows()
        
        cell.setTitleAndAuthor(title: data[indexPath.row].title, author: data[indexPath.row].author)
        
        return cell
    }
}

extension BookListViewController: BookListCustomCellDelegate {
    func selected(title: String?, author: String?) {
        print("作品名: \(title ?? ""), 作者: \(author ?? "")")
    }
}
