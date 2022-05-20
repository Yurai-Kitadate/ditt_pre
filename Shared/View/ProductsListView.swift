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
        ZStack{
            Color(red: 1, green: 0.905, blue: 1.0)
                             .ignoresSafeArea()
            VStack(){
                VStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .shadow(color: .gray, radius: 3, x: 5, y: 5)
                        .frame(width:400, height: 0)
                }
                HStack{
                    Image("Logo1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Spacer()
                }
                Divider()
                ScrollView(showsIndicators:false){
                    VStack(alignment: .center,spacing: 15) {
                        ForEach((0...2), id: \.self) { i in
                            if i == 0{
                                Rectangle()
                                    .foregroundColor(.blue)
                                    .shadow(color: .gray, radius: 3, x: 5, y: 5)
                                    .frame(width:400, height: 0)
                            }
                            NavigationLink(destination:ProductDetailView(product: mockProducts[i])){
                                ProductCardView(product: mockProducts[i])
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
