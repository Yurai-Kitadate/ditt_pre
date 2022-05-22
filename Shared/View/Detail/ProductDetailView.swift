import Foundation
import SwiftUI
@MainActor
class ProductDetailStore: ObservableObject {
    //@Published var product_details :Product_Detail
    @Published private(set) var product_detail = [Product_Detail]()
    func loadProduct(id:String) async {
        let url = URL(string: "https://ditt.codephilia-inc.com/api/products/" + id)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept": "application/vnd.github.v3+json"
        ]
        
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let value = try! decoder.decode([Product_Detail].self, from: data)
        
        product_detail = value
    }
}
struct ProductDetailView:View{
    @StateObject private var productDetailStore = ProductDetailStore()
    
//    init(){
//        _productDetailStore = StateObject(wrappedValue: ProductDetailStore())
//    }
    @State var image: UIImage?
    let id: String
    //let product : Product_Detail
    var body:some View{
        ZStack{
            Color(red: 1, green: 0.905, blue: 1.0)
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    if productDetailStore.product_detail.isEmpty{
                        Text("a")
                    }else{
                        ProductCardView(product: Product(id: productDetailStore.product_detail[0].id, thumbnailUrl: productDetailStore.product_detail[0].thumbnailURL, title: productDetailStore.product_detail[0].title, introduction: productDetailStore.product_detail[0].introduction, createdAt: productDetailStore.product_detail[0].createdAt, updatedAt:productDetailStore.product_detail[0].updatedAt))
                        EachSectionCardView(sectionType: .ideaSection, content: productDetailStore.product_detail[0].ideaSection)
                        EachSectionCardView(sectionType: .designSection, content: productDetailStore.product_detail[0].designSection)
                        EachSectionCardView(sectionType: .technologySection, content: productDetailStore.product_detail[0].technologySection)
                        EachSectionCardView(sectionType: .teamSection, content: productDetailStore.product_detail[0].teamSection)
                    }
                }
            }.task {
                await productDetailStore.loadProduct(id: productDetailStore.product_detail[0].id)
            }
        }
    }
}
enum CardType {
    case ideaSection
    case designSection
    case technologySection
    case teamSection
}
