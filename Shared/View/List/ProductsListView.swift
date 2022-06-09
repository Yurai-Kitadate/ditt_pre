import Foundation
import SwiftUI
struct ProductsListView: View {
    let screen: CGRect = UIScreen.main.bounds
    let mock : [Product] = [.mock1,.mock2,.mock3]
    let mock_detail : [Product_Detail] = [.mock1,.mock2,.mock3]
    var body: some View {
        ScrollView{
            VStack{
                ForEach((0..<mock.count), id: \.self) { i in
                    NavigationLink(destination: Text(mock[i].id)){
                        ProductBlockView(product: mock[i])
                    }
                    .buttonStyle(HighlightButtonStyle())
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Image("Logo1")
                .resizable()
                .frame(width: 440/7, height: 160/7)
        )
    }
}
struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
    }
}
