//
//  BookListCustomCell.swift
//  my book
//
//  Created by 1mash0 on 2021/09/19.
//

import UIKit

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
    
    weak var delegate: BookListCustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViewStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Viewのセットアップ
    func setupViewStyle() {
        view.layer.cornerRadius = 6.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.6
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        tap.minimumPressDuration = 0.0
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    /// Viewが押されたときに呼ばれる
    /// - Parameter sender: sender
    @objc func viewTapped(sender: UIGestureRecognizer) {
        if sender.state == .began {
            view.backgroundColor = .lightGray
        } else if sender.state == .ended {
            view.backgroundColor = .white
            
            self.delegate?.selected(title: titleLabel.text, author: authorLabel.text)
        }
    }
    
    /// タイトルと作者を設定する
    /// - Parameters:
    ///   - title: タイトル
    ///   - author: 作者
    func setTitleAndAuthor(title: String?, author: String?) {
        titleLabel.text = title
        authorLabel.text = author
        // imageViewを非表示にする
        coverImageView.isHidden = true
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
