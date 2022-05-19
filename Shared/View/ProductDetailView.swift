//
//  ProductDetailView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
import SwiftUI
struct ProductDetailView:View{
    @State var image: UIImage?
    let product : Product
    var body:some View{
        
        HStack{
            VStack(alignment: .leading){
                HStack(alignment: .bottom){
                    Text(product.title).font(.title)
                    Text(product.teamSection).font(.caption)
                }
                Divider()
                URLImage(url: product.thumbnailURL)
                                .aspectRatio(contentMode: .fit)
                Text("Introduction").font(.body)
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
