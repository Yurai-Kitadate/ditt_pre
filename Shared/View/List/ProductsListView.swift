import SwiftUI
@MainActor
class ProductsStore: ObservableObject {
    @Published private(set) var products = [Product]()
    
    func loadProducts() async {
        let url = URL(string: "https://ditt.codephilia-inc.com/api/products")!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/vnd.github.v3+json"
        ]
        
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try! decoder.decode([Product].self, from: data)
        
        products = value
    }
}
struct ProductsListView: View {
    @StateObject var productsStore: ProductsStore
    
    init() {
        _productsStore = StateObject(wrappedValue: ProductsStore())
    }
    var body: some View {
        ZStack{
            VStack(){
                VStack {
                    Rectangle()
                        .foregroundColor(.blue)
                        .shadow(color: .gray, radius: 3, x: 5, y: 5)
                        .frame(width:500, height: 0)
                }
                HStack{
                    Image("Logo1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                    Spacer()
                }
                .background(.white)
                ScrollView(showsIndicators:false){
                    VStack(alignment: .center,spacing: 20) {
                        Rectangle()
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 3, x: 5, y: 5)
                            .frame(width:500, height: 0)
                        if productsStore.products.isEmpty {
                            ZStack(alignment: .center){
                            Rectangle()
                                .foregroundColor(Color(red: 1, green: 0.905, blue: 1.0))
                                .frame(width: 500, height:1200)
                                VStack{
                                    ProgressView("now loding")
                                    Spacer()
                                }
                            }
                        } else {
                            ForEach((0..<productsStore.products.count), id: \.self) { i in
                                NavigationLink(destination:ProductDetailView(id: productsStore.products[i].id)){
                                    ProductCardView(product: productsStore.products[i])
                                }
                            }
                        }
                    }.background(Color(red: 1, green: 0.905, blue: 1.0))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }.task {
                    await productsStore.loadProducts()
                }
            }
        }
    }
}
