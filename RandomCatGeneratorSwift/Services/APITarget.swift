//
//  APITarget.swift
//  RandomCatGeneratorSwift
//
//  Created by user242913 on 7/21/23.
//

import Foundation
import Moya
	
enum APITarget {
    case getRandomCat
}

extension APITarget: TargetType {

    var baseURL: URL {
        guard let url = URL(string: "https://cataas.com") else {
            fatalError("Cannot access URL")
        }
        return url
    }

    var path: String {
        switch self {
        case .getRandomCat:
            return "cat"
        }
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        .requestParameters(parameters: [
            "json": "true",
        ], encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json", "Cache-Control": "no-cache"]
    }
}
