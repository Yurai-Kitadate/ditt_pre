//
//  Product+Mock.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
extension Product {
    static let mock1 = Product(
        id: 1, thumbnailURL: "https://techcrunch.com/wp-content/uploads/2019/03/patreon-money-large.png?w=1390&crop=1", title: "ditt!", introduction: "アイデアやプロトタイプを見れます。", ideaSection: "d", designSection: "e", technologySection: "f", teamSection: "Codephilia", createdAt: Data(), updatedAt: Data()
    )
    static let mock2 = Product(
        id: 2, thumbnailURL: "a", title: "両思いチェッカー", introduction: "気になる子と両思いかも！？", ideaSection: "d", designSection: "e", technologySection: "f", teamSection: "雪の国から", createdAt: Data(), updatedAt: Data()
    )
    static let mock3 = Product(
        id: 3, thumbnailURL: "a", title: "ブタメン", introduction: "豚でもないウマさ!!", ideaSection: "d", designSection: "e", technologySection: "f", teamSection: "Acecook", createdAt: Data(), updatedAt: Data()
    )
    
}
