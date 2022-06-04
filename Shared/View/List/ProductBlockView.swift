//
//  ProductBlockView.swift
//  ditt_pre
//
//  Created by yurai on 2022/06/04.
//

import Foundation
import SwiftUI
struct ProductBlockView:View{
    let screen: CGRect = UIScreen.main.bounds
    var product : Product
    var body: some View{
        VStack{
            Divider()
            HStack{
                Image("tech")
                    .resizable()
                    .frame(width: screen.width/15, height: screen.width/15)
                VStack(alignment: .leading){
                    Text(product.title)
                        .font(.title)
                    Text(product.user)
                        .font(.caption)
                }
                Spacer()
            }.padding(7)
            URLImage(url: product.thumbnailUrl)
            Text(product.introduction)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
                .fixedSize(horizontal: false, vertical: false)
            
        }
    }
}
