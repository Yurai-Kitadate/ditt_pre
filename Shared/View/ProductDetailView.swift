//
//  ProductDetailView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
import SwiftUI
struct ProductDetailView:View{
    let product : Product
    var body:some View{
        HStack{
            VStack(alignment: .leading){
                HStack(alignment: .bottom){
                    Text(product.title).font(.title)
                    Text(product.teamSection).font(.caption)
                }
                Divider()
                Text(product.thumbnailURL)
                Text(product.introduction)
                Text(product.ideaSection)
                Text(product.designSection)
                Text(product.technologySection)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}
