//
//  MyAPI.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/12/02.
//

import Foundation

import RxSwift
import Moya

public class MyAPI {
    let provider = MoyaProvider<MyTarget>()
    
    func request() {
        provider.request(.lists) { (result) in
            switch result {
            case let .success(response):
                let result = try? response.map(ResponseData.self)
                print("moya")
            case let .failure(error):
                print("moyaFail")
            }
            
        }
    }
}
