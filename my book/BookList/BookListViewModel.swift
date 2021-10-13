//
//  BookListViewModel.swift
//  my book
//
//  Created by 1mash0 on 2021/09/19.
//

import Foundation

final class BookListViewModel {
    
    var bookListRows: [BookListRows] = []
    
    var count: Int {
        return getBookListRows().count
    }
    
    func getBookListRows() -> [BookListRows] {
        return bookListRows
    }
    
    func setBookListRows() {
        let tempTitle = ["ONE PIECE", "僕のヒーローアカデミア", "黒執事", "推しの子", "D.Gray-man", "王様達のヴァイキング", "銀魂", "BLEACH", "NARUTO"]
        let tempAuthor = ["尾田栄一郎", "堀越耕平", "枢やな", "横槍メンゴ、赤坂アカ", "星野桂", "さだやす", "空知英秋", "久保帯人", "岸本斉史"]
        
        tempTitle.enumerated().forEach{ (index, row) in
            let tempBookListRow = BookListRows(title: row, author: tempAuthor[index])
            bookListRows.append(tempBookListRow)
        }
    }
}

struct BookListRows {
    var title: String?
    var author: String?
}
