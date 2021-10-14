//
//  Enums.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

enum URLs {
    case openBD
    case registerBook
    
    func getURL() -> String {
        switch self {
        case .openBD:
            return "https://~~~~~~"
        case .registerBook:
            return "https://~~~~~~~"
        }
    }
}

enum BaseUrl {
    case openBD
    case myBookApi
    
    func getBaseUrl() -> String {
        switch self {
        case .openBD:
            return "https://openBD/hogehoge/"
        case .myBookApi:
            return "https://hogehoge/"
        }
    }
}

enum ApiPath {
    case getBookList
    case registerBook
    
    func getApiPath() -> String {
        switch self {
        case .getBookList:
            return "getBookList/"
        case .registerBook:
            return "registerBook/"
        }
    }
}
