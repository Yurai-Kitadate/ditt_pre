//
//  ProductDetailView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
import SwiftUI
struct ProductInListView:View{
    let product:Product
    var body:some View{
        NavigationView{
            NavigationLink(destination:ProductDetailView()){
                VStack{
                    Text(product.title).font(.title)
                    HStack{
                        Text(product.introduction)
                        Spacer()
                        Text(product.teamSection)
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}
