//
//  BookListViewModel.swift
//  my book
//
//  Created by 1mash0 on 2021/09/19.
//

import RxSwift
import RxDataSources

final class BookListViewModel {
    var model = BookListModel()
    var bookListItems = BehaviorSubject<[BookList]>(value: [])
    
    private var bookList: [BookList] = []
    
    func setBookListRows() {
        model.fetchBookListData()
        
        bookListItems.onNext(model.bookListItems)
    }
    
    func getBookListCount() -> Int {
        return model.bookListItems.count
    }
}
