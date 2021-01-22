//
//  Progress.swift
//  my book
//
//  Created by 61-201906-2939 on 2020/10/29.
//

import Foundation
import SVProgressHUD

final class Progress {
    static let progress = SVProgressHUD.self
    
    /// インジケータの初期設定
    static func setup() {
        // インジケータのスタイルをカスタムに変更
        progress.setDefaultStyle(.custom)
        
        // インジケータが表示されている間、後ろのUIを操作できないように設定
        progress.setDefaultMaskType(.clear)
        
//        // インジケータのバックグラウンドカラーを設定
//        progress.setBackgroundColor(UIColor.white)
//
//        // インジケータのフォアグラウンドカラーを設定
//        progress.setForegroundColor(UIColor(hex: Pallet.greenTextColor.hex))
    }
    
    /// インジケータ表示
    static func show() {
        progress.show()
    }
    
    /// インジケータ非表示
    static func popActivity() {
        progress.popActivity()
    }
}
