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
        VStack {
            Image("turtlerock")
                .resizable()
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:350, height: 300)
        }
    }
}


