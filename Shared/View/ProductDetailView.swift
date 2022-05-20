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
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 3, x: 5, y: 5)
                    .frame(width:350, height: 350)
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
