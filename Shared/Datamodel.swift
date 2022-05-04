//
//  Datamodel.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
struct Product : Identifiable{
    var id                : Int
    var thumbnailURL      : String
    var title             : String
    var introduction      : String
    var ideaSection       : String
    var designSection     : String
    var technologySection : String
    var teamSection       : String
    var createdAt         : Data
    var updatedAt         : Data
}
