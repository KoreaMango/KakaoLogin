//
//  Alamo.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/25.
//

import Foundation

import Alamofire

struct NetworkAlamo {
    
    func getData(url : String) {
        let urlRequest : URLRequest = URLRequest(url: url.asURL(), method: .get)
        
        AF.request(urlRequest)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Model) { response in
                ...
            }
    }
}
