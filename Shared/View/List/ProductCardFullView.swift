import SwiftUI
struct ProductCardFullView: View {
    let screen: CGRect = UIScreen.main.bounds
    let product : Product
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:screen.width / 1.1)
            VStack(alignment: .center){
                URLImage(url:product.thumbnailUrl)
                    .frame(width:screen.width / 1.1, height: 250)
                HStack{
                    Rectangle()
                        .fill(Color.white)
                        .opacity(0)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 3, x: 5, y: 5)
                        .frame(width:(screen.width - screen.width / 1.1)/2, height: 0)
                    Text(product.title).foregroundColor(.black)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .fill(Color.white)
                        .opacity(0)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 3, x: 5, y: 5)
                        .frame(width:(screen.width - screen.width / 1.1)/2, height:0)
                    Text(product.introduction).foregroundColor(.gray).font(.custom("caption", size: 10))
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width:screen.width / 1.15)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}



