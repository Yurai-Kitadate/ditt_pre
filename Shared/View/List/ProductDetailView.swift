//
//  ProductDetailView.swift
//  ditt_pre
//
//  Created by yurai on 2022/06/02.
//

import Foundation
import SwiftUI
struct ProductDetailView:View{
    let product_detail: Product_Detail
    var body:some View {
        Text(product_detail.id)
    }
}
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product_detail: .mock1)
    }
}
