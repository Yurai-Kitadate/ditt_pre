import SwiftUI
struct ProductCardView: View {
    let product : Product
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 3, x: 5, y: 5)
                .frame(width:350, height: 350)
                
            VStack(alignment: .leading){
                URLImage(url:product.thumbnailUrl)
                //.resizable()
                    .cornerRadius(20, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMinYCorner])
                    //.shadow(color: .gray, radius: 3, x: 5, y: 5)
                    .frame(width:350, height: 250)
                //ここスペース使わずちゃんとpaddingとかでどうにかする
                Text("  " + product.title).foregroundColor(.black)
                Text("")
                Text("  " + product.introduction).foregroundColor(.gray).font(.caption)
            }
        }
    }
}


