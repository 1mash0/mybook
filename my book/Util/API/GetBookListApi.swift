//
//  GetBookListApi.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import RxSwift
import Moya

struct GetBookListApiTargetType: ApiTargetType {
    typealias Response = GetBookListApiEntity
    
    var baseURL: URL {
        return URL(string: BaseUrl.myBookApi.getBaseUrl())!
    }
    
    var path: String {
        return ApiPath.getBookList.getApiPath()
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        let param: [String: Any] = ["userId": id]
        
        return .requestParameters(parameters: param, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        [
            "Content-Type": "application/json",
            "x-auth-token": "access_token"
        ]
    }
    
    var sampleData: Data {
        let jsonPath = R.file.bookListStubDataJson.path()
        guard let path = jsonPath,
              let file = FileHandle(forReadingAtPath: path) else {
            return Data()
        }
        
        return file.readDataToEndOfFile()
    }
    
    var id: String {
        return "TEST001"
        //        return DataManager.shared.id ?? ""
    }
    
    init() {}
}

struct GetBookListApiEntity: Codable {
    struct BookList: Codable {
        // タイトル
        let title: String?
        // 作者
        let author: String?
        // 巻数
        let part_number: Int?
        // 表紙
        let cover_url: String?
    }
    
    let response: [BookList]
}
