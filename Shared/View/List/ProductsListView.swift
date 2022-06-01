import Foundation
import SwiftUI
@MainActor
class ProductsStore: ObservableObject {
    @Published private(set) var products = [Product]()
    func loadProducts() async {
        let url = URL(string: "https://ditt.codephilia-inc.com/api/products")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        products = try! d.decode([Product].self, from: data)
    }
}
struct ProductsListView: View {
    let screen: CGRect = UIScreen.main.bounds
    @StateObject var productsStore: ProductsStore
    
    init() {
        _productsStore = StateObject(wrappedValue: ProductsStore())
    }
    var body: some View {
        ZStack{
            myGray.ignoresSafeArea()
            VStack(){
                ScrollView(showsIndicators:false){
                    VStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 3, x: 5, y: 5)
                            .frame(width:screen.width, height: 0)
                    }
                    VStack(alignment: .center,spacing: 20) {
                        Rectangle()
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 3, x: 5, y: 5)
                            .frame(width:screen.width, height: 0)
                        if productsStore.products.isEmpty {
                            ZStack(alignment: .center){
                                Rectangle()
                                    .foregroundColor(myGray)
                                    .frame(width: screen.width, height:1200)
                                VStack{
                                    ProgressView("now loding")
                                    Spacer()
                                }
                            }
                        } else {
                            ForEach((0..<productsStore.products.count), id: \.self) { i in
                                NavigationLink(destination:ProductDetailView(
                                    id: productsStore.products[i].id,title: productsStore.products[i].title
                                )) {
                                    
                                    ProductCardView(product: productsStore.products[i])
                                    
                                }
                                .buttonStyle(HighlightButtonStyle())
                                //viewがタップで透けないように
                                
                            }
                        }
                    }.background(myGray)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }.task {
                    await productsStore.loadProducts()
                }
            }
        }
    }
}
struct HighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}
