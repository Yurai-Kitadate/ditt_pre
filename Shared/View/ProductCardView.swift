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
            ZStack(alignment: .top) {
                Image(product.thumbnailURL)
//                URLImage(url:product.thumbnailURL)
                                //.aspectRatio(contentMode: .fit)
                                //.scaledToFit()
//                HStack {
//                    VStack() {
//                        Text(product.teamSection)
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .shadow(radius: 4.0)
//                        Text(product.title)
//                            .font(.largeTitle)
//                            .foregroundColor(.white)
//                            .shadow(radius: 4.0)
//                    }
//                    .padding()
//                    Spacer()
//                }
            }.frame(
                width: 340,
                height: 300,
                alignment: .top)
            .cornerRadius(20)
            .disabled(true)
            .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.blue, lineWidth: 5)
                        )
            
    }
}
