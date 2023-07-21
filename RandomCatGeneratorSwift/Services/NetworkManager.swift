//
//  NetworkManager.swift
//  RandomCatGeneratorSwift
//
//  Created by user242913 on 7/21/23.
//

import Moya
import Foundation

protocol NetworkManagerProtocol {
    func fetchCharacters(completion: @escaping (Result<CatResponseModel, Error>) -> Void)
}



final class NetworkManger: NetworkManagerProtocol {

    private var provider = MoyaProvider<APITarget>()

    func fetchCharacters(completion: @escaping (Result<CatResponseModel, Error>) -> Void) {
        request(target: .getRandomCat, completion: completion)
    }
}

private extension NetworkManger {

    func request<T:Decodable>(target: APITarget, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results : T = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
