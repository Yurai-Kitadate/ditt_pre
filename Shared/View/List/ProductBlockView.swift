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
            URLImage(url: product.thumbnailUrl)
            //            HStack{
            //                Image(product.imageName)
            //                    .resizable()
            //                    .frame(width: screen.width/13, height: screen.width/13)
            //                    .clipShape(Circle())
            //                    .overlay(
            //                        RoundedRectangle(cornerRadius: 75).stroke(.gray, lineWidth: 0.5)
            //                    )
            //                VStack(alignment: .leading){
            //                    Text(product.title)
            //                        .font(.title)
            //                    Text(" " + product.user)
            //                        .font(.caption)
            //                }
            //                Spacer()
            //            }.padding(7)
            Text(product.title)
                .font(.title)
            
            HStack{
                Text(product.introduction)
                    .multilineTextAlignment(.leading)
                    .lineLimit(5)
                    .fixedSize(horizontal: false, vertical: false)
                    .font(.custom("Times-Roman", size: 15))
                Spacer()
            }
            HStack{
                Image(product.imageName)
                    .resizable()
                    .frame(width: screen.width/13, height: screen.width/13)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 75).stroke(.gray, lineWidth: 0.5)
                    )
                Text(product.user)
                Spacer()
            }
            
        }
        .contextMenu {
            Button(action: {
                UIPasteboard.general.string = "https://ditt.codephilia-inc.com/products/" + product.id
            }) {
                Text("Copy")
                Image(systemName: "doc.on.doc")
            }
            
            Button(action: {
                print("Share")
            }) {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
            }
        }
        
        
    }
}
struct ProductBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ProductBlockView(product: .mock1)
    }
}

