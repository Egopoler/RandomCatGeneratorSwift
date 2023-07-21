//
//  CatResponseModel.swift
//  RandomCatGeneratorSwift
//
//  Created by user242913 on 7/21/23.
//

struct CatResponseModel: Codable {
    let tags: [String]?
    let createdAt: String?
    let updatedAt: String?
    let validated: Bool?
    let owner: String?
    let file: String
    let mimetype: String
    let size: Int?
    let _id: String
    let url: String
}

