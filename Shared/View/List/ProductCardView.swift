import SwiftUI
struct ProductCardView: View {
    let product : Product
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:350)
            VStack(alignment: .center){
                URLImage(url:product.thumbnailUrl)
                    .frame(width:350, height: 250)
                Text(product.title).foregroundColor(.black)
                Text(product.introduction).foregroundColor(.gray).font(.custom("caption", size: 10)).multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: false).frame(width:330)
                    .padding(10)
            }
        }
    }
}


