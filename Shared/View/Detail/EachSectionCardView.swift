//
//  EachSectionCardView.swift
//  ditt_pre
//
//  Created by yurai on 2022/05/21.
//

import Foundation
import SwiftUI
struct EachSectionCardView: View {
    let sectionType:CardType
    let content:String
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:350)
            HStack{
                VStack(alignment: .leading,spacing: 20){
                    CategoryTitleView(sectionType: sectionType)
                    Text(content)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: false)
                }
                Spacer()
            }
            .padding(30)
        }
    }
    
}

