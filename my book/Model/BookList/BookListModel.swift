//
//  BookListModel.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import RxSwift

struct BookList: Codable {
    // タイトル
    let title: String?
    // 作者
    let author: String?
    // 巻数
    let partNumber: Int?
    // 表紙
    let cover: String?
}

class BookListModel {
    var bookListItems: [BookList] = []
    
    private var disposeBag = DisposeBag()
    
    /// リストを取得する
    func fetchBookListData() {
        let request = GetBookListApiTargetType()
        
        Progress.show()
        
        ApiClient.shared.requestStub(request)
            .subscribe(onSuccess: { response in
                response.response.forEach { row in
                    let tempBookListRow = BookList(title: row.title,
                                                   author: row.author,
                                                   partNumber: row.part_number,
                                                   cover: row.cover_url)
                    self.bookListItems.append(tempBookListRow)
                }
            }, onFailure: { error in
                print(error)
            })
            .disposed(by: disposeBag)
        
        Progress.popActivity()
    }
}
