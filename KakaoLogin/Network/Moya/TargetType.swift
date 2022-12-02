//
//  TargetType.swift
//  KakaoLogin
//
//  Created by 강민규 on 2022/11/25.
//

import Foundation

import Moya

// TargetType정의: network템플릿 작성

public enum MyTarget {
    case lists
}

extension MyTarget: TargetType {
    
    public var baseURL: URL {
        guard let url = URL(string: Base.url) else {
            fatalError("fatal error - invalid url")
        }
        return url
    }

    public var path: String {
        switch self {
        case .lists:
            return "/list"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .lists:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .lists:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
      return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
      return .successCodes
    }
}
