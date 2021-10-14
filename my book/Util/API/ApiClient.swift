//
//  ApiClient.swift
//  my book
//
//  Created by 1mash0 on 2021/10/14.
//

import Moya
import RxSwift
import RxCocoa

final class ApiClient {
    private init() {}
    static let shared = ApiClient()
    
    // MARK: - Private
    
    private let provider = MoyaProvider<MultiTarget>()
    
    private let stubProvider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub)
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Public
    
    func request<G: ApiTargetType>(_ request: G) -> Single<G.Response> {
        Single<G.Response>.create { observer in
            self.makeRequest(request)
                .subscribe(onSuccess: { response in
                    observer(.success(response))
                }, onFailure: { error in
                    // 全体で共通して行いたいエラーハンドリング
                    observer(.failure(error))
                })
        }
    }
    
    func makeRequest<G: ApiTargetType>(_ request: G) -> Single<G.Response> {
        provider.rx
            .request(MultiTarget(request))
            .filterSuccessfulStatusCodes() // ステータスコードのチェック
            .map(G.Response.self, failsOnEmptyData: false)
    }
    
    func requestStub<G:ApiTargetType>(_ request: G) -> Single<G.Response> {
        Single<G.Response>.create { observer in
            self.makeRequestStub(request)
                .subscribe(onSuccess: { response in
                    observer(.success(response))
                }, onFailure: { error in
                    if let error = error as? MoyaError {
                        // 全体で共通して行いたいエラーハンドリング
                        observer(.failure(error))
                    }
                })
        }
    }
    
    func makeRequestStub<G: ApiTargetType>(_ request: G) -> Single<G.Response> {
//        stubProvider.rx
//            .request(MultiTarget(request))
//            .filterSuccessfulStatusCodes() // ステータスコードのチェック
//            .map(G.Response.self, failsOnEmptyData: false)
        
        stubProvider.rx
            .request(MultiTarget(request))
            .filterSuccessfulStatusCodes() // ステータスコードのチェック
            .map(G.Response.self, failsOnEmptyData: false)
    }
}
