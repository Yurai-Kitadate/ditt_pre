//
//  ProductsRowView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
import SwiftUI
struct ProductsListView: View {
    private let mockProducts: [Product] = [
        .mock1, .mock2, .mock3
    ]
    var body: some View {
        NavigationView{
            List(mockProducts) { product in
                NavigationLink(destination:ProductDetailView(
                    product : product
                )){
                    VStack{
                        HStack{
                            Text(product.title).font(.title)
                            Spacer()
                        }
                        HStack{
                            Text(product.introduction).font(.caption).foregroundColor(Color.gray)
                            Spacer()
                            Text(product.teamSection).font(.body)
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}
