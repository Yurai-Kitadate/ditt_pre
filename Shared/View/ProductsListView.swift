//
//  ProductsRowView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/04.
//

import Foundation
import SwiftUI
struct ProductsListView: View {
    
    let mockProducts: [Product] = [
        .mock1, .mock2, .mock3
    ]
    
    var body: some View {
        VStack(){
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Spacer()
            }
            ScrollView(showsIndicators:false){
                //ScrollView {
                //NavigationView{
                VStack(alignment: .leading,spacing: 15) {
                    ForEach((0...2), id: \.self) { i in
                        
                        NavigationLink(destination:ProductDetailView(product: mockProducts[i])){
                            ProductCardView(product: mockProducts[i])
                        }
                    }
                }
                //}
            }
            .navigationBarBackButtonHidden(true)
            //}
        }
    }
}
