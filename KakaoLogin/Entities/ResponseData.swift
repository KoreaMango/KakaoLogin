//
//  ResponseData.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/26.
//

import Foundation

struct ResponseData: Codable {
    var id: String
    var width: Int
    var height: Int
    var url: String
    var download_url: String
}
