//
//  BookListCustomCell.swift
//  my book
//
//  Created by 1mash0 on 2021/09/19.
//

import UIKit
import RxSwift

protocol BookListCustomCellDelegate: AnyObject {
    func selected(title: String?, author: String?)
}

class BookListCustomCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    // タイトルラベル
    @IBOutlet weak var titleLabel: UILabel!
    // 作者ラベル
    @IBOutlet weak var authorLabel: UILabel!
    // 表紙ImageView
    @IBOutlet weak var coverImageView: UIImageView!
    
    // viewがタップされた時のObervable
    var viewTapped: Observable<UITapGestureRecognizer> {
        return view.rx.tapGesture().asObservable()
    }
    
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViewStyle()
        setupImageView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // viewのタップ処理が複数回走らないように毎回再生成
        disposeBag = DisposeBag()
    }
    
    /// Viewのセットアップ
    func setupViewStyle() {
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(viewLongTapped(sender:)))
        longTap.minimumPressDuration = 0.0
        longTap.delegate = self
        view.addGestureRecognizer(longTap)
    }
    
    @objc func viewLongTapped(sender: UIGestureRecognizer) {
        if sender.state == .began {
            view.backgroundColor = .lightGray
        } else if sender.state == .ended {
            view.backgroundColor = .white
        }
    }
    
    func setupImageView() {
        coverImageView.layer.shadowColor = UIColor.black.cgColor
        coverImageView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        coverImageView.layer.shadowOpacity = 0.4
        coverImageView.layer.shadowRadius = 4
        coverImageView.layer.masksToBounds = false
    }
    
    /// タイトルと作者を設定する
    /// - Parameters:
    ///   - title: タイトル
    ///   - author: 作者
    func setTitleAndAuthor(bookInfo: BookList) {
        var partNumberText = ""
        if let partNumber = bookInfo.partNumber {
            partNumberText = "(\(partNumber))"
        }
        
        titleLabel.text = "\(bookInfo.title ?? "")\(partNumberText)"
        authorLabel.text = bookInfo.author
        
        coverImageView.loadImageAsync(url: URL(string: bookInfo.cover ?? ""), defaultImage: UIImage())
    }
    
    /// Gestureの同時認識を許可
    ///
    /// - Parameter gestureRecognizer: gestureRecognizer description
    /// - Parameter otherGestureRecognizer: otherGestureRecognizer description
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // スクロール中にグラフビューと顧客ビューがタップされたらGestureを同時認識しないようにする
        if gestureRecognizer is UITapGestureRecognizer,
           otherGestureRecognizer is UIPanGestureRecognizer {
            return false
        } else { // それ以外はGestureの同時認識を許可
            return true
        }
    }
}
