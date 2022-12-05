//
//  NetworkAlamo.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/25.
//

import Foundation

import Alamofire
import RxSwift

class NetworkAlamo {
    var urlRequest : URLRequest?
    var path = "/list"
    
    init() {
        self.urlRequest = request(with: Base.url!)
    }
    
    func request(with baseURL: URL) -> URLRequest? {
        guard let components = URLComponents(string: baseURL.description + path) else { fatalError("URL 컴포넌트를 생성하지 못했습니다.") }
        
        guard let url = components.url else {
            fatalError("url을 찾을 수 없습니다.")
        }
        
        let request = try? URLRequest(url: url, method: .get)

        return request
    }
    
    func send() -> Observable<String> {
        return Observable<String>.create { observer in
         
            AF.request(self.urlRequest!)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: [ResponseData].self) { response in
                    observer.onNext(response.description)
                }
            
            return Disposables.create()
        }
    }
}
