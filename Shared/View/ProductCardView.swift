import SwiftUI
//struct ItemDetailView: View {
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack(alignment: .center, spacing: 0) {
//                ItemMainView()
//            }
//        }
//    }
//}
struct ProductCardView: View {
    let product : Product
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:350, height: 300)
                
            VStack(){
                URLImage(url:product.thumbnailURL)
                //.resizable()
                    .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
                    //.shadow(color: .gray, radius: 3, x: 5, y: 5)
                    .frame(width:350, height: 235)
                
            }
        }
    }
}


