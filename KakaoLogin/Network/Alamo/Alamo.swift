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
        guard let url = try? url.asURL() else {return}
        guard let urlRequest: URLRequest = try? URLRequest(url: url, method: .get) else {return}
    
        AF.request(urlRequest)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [ResponseData].self) { response in
                print(response)
            }
    }
}
