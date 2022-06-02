import Foundation
import SwiftUI
struct ProductsListView: View {
    let screen: CGRect = UIScreen.main.bounds
    let mock : [Product] = [.mock1,.mock2,.mock3]
    var body: some View {
        ScrollView{
            VStack{
                ForEach((0..<mock.count), id: \.self) { i in
                    HStack{
                        Image("tech")
                            .resizable()
                            .frame(width: screen.width/15, height: screen.width/15)
                        Text(mock[i].title)
                        Spacer()
                    }
                    URLImage(url: mock[i].thumbnailUrl)
                    Text(mock[i].introduction)
                        .multilineTextAlignment(.leading)
                        .lineLimit(5)
                        .fixedSize(horizontal: false, vertical: false)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        //.navigationBarTitle(Text("Instagram"), displayMode: .inline)
        .navigationBarItems(
            leading: Image("Logo1")
                .resizable()
                .frame(width: 440/7, height: 160/7)
            )
                .padding(.bottom, 10)
        
    }
}
struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
