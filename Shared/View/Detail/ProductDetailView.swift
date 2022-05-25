import Foundation
import SwiftUI
@MainActor
class ProductDetailStore: ObservableObject {
    @Published private(set) var product_detail:Product_Detail = Product_Detail(
        id: "", thumbnailUrl: "", title: "", introduction: "", ideaSection: "", designSection: "", technologySection: "", teamSection: "", createdAt: "", updatedAt: "")
    func loadProduct(id:String) async {
        let url = URL(string: "https://ditt.codephilia-inc.com/api/products/" + id)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let (data, _) = try! await URLSession.shared.data(for: urlRequest)
        
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        product_detail = try! d.decode(Product_Detail.self, from: data)
    }
}
struct ProductDetailView:View{
    @StateObject private var productDetailStore = ProductDetailStore()
//    init() {
//        _productDetailStore = StateObject(wrappedValue: ProductDetailStore())
//    }
    @State var image: UIImage?
    let id: String
    var body:some View{
        ZStack{
            Color(red: 1, green: 0.905, blue: 1.0)
                .ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    if productDetailStore.product_detail.id == ""{
                        ProgressView("now loding")
                    }else{
                        ProductCardView(product: Product(id: productDetailStore.product_detail.id, thumbnailUrl: productDetailStore.product_detail.thumbnailUrl, title: productDetailStore.product_detail.title, introduction: productDetailStore.product_detail.introduction, createdAt: productDetailStore.product_detail.createdAt, updatedAt:productDetailStore.product_detail.updatedAt))
                        EachSectionCardView(sectionType: .ideaSection, content: productDetailStore.product_detail.ideaSection)
                        EachSectionCardView(sectionType: .designSection, content: productDetailStore.product_detail.designSection)
                        EachSectionCardView(sectionType: .technologySection, content: productDetailStore.product_detail.technologySection)
                        EachSectionCardView(sectionType: .teamSection, content: productDetailStore.product_detail.teamSection)
                    }
                }
            }.task {
                await productDetailStore.loadProduct(id: id)
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
