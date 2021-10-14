//
//  BookListViewController.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class BookListViewController: UIViewController {
    let viewModel = BookListViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "購入済み"
        
        setupTableView()
        viewModel.setBookListRows()
        bindTableView()
        
        navigationItem.setRightButton(title: Const.ADD_BUTTON_LABEL, style: .plain, target: self, action: #selector(tappedRightButton(_:)))
    }
    
    @objc func tappedRightButton(_ sender: AnyObject) {
        print("tappedRightButton")
        
        if let barCodeReaderViewController = R.storyboard.barCodeReader.instantiateInitialViewController() {
            barCodeReaderViewController.modalPresentationStyle = .fullScreen
            
            self.navigationController?.present(barCodeReaderViewController, animated: true, completion: nil)
        }
    }
    
    /// TableViewのセットアップ
    private func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(resource: R.nib.bookListCustomCell), forCellReuseIdentifier: R.reuseIdentifier.bookListCustomCell.identifier)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    /// TableViewにデータをバインド
    private func bindTableView() {
        viewModel.bookListItems
            .bind(to: tableView.rx.items(cellIdentifier: R.nib.bookListCustomCell.identifier, cellType: BookListCustomCell.self)) { indexPath, bookList, cell  in
                cell.setTitleAndAuthor(bookInfo: bookList)
                
                cell.viewTapped
                    .when(.recognized)
                    .subscribe(onNext: { _ in
                        print("作品名: \(cell.titleLabel.text ?? ""), 作者: \(cell.authorLabel.text ?? "")")
                    })
                    .disposed(by: cell.disposeBag)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                self.tableView.deselectRow(at: indexPath, animated: false)
            })
            .disposed(by: disposeBag)
    }
}

extension BookListViewController: UITableViewDelegate {
}
