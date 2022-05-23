//
//  Datamodel.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
struct Product_Detail : Decodable,Identifiable{
    var id                : String
    var thumbnailUrl      : String
    var title             : String
    var introduction      : String
    var ideaSection       : String
    var designSection     : String
    var technologySection : String
    var teamSection       : String
    var createdAt         : String
    var updatedAt         : String
    private enum CodingKeys: String, CodingKey {
        case id
        case thumbnailUrl
        case title
        case introduction
        case ideaSection
        case designSection
        case technologySection
        case teamSection
        case createdAt
        case updatedAt
    }
}
struct Product : Decodable,Identifiable{
    var id                : String
    var thumbnailUrl     : String
    var title             : String
    var introduction      : String
    var createdAt         : String
    var updatedAt         : String
    private enum CodingKeys: String, CodingKey {
        case id
        case thumbnailUrl
        case title
        case introduction
        case createdAt
        case updatedAt
    }
}

