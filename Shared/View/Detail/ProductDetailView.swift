import Foundation
import SwiftUI
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
        DispatchQueue.main.async { [self] in
            self.product_detail = try! d.decode(Product_Detail.self, from: data)
        }
    }
}
struct ProductDetailView:View{
    let screen: CGRect = UIScreen.main.bounds
    @StateObject private var productDetailStore = ProductDetailStore()
    @State var image: UIImage?
    let id: String
    let title: String
    var body:some View{
        ZStack{
            myGray
                .ignoresSafeArea()
            ScrollViewReader { reader in
                ScrollView{
                    VStack(alignment: .center,spacing: 20){
                        if productDetailStore.product_detail.id == ""{
                            ProgressView("now loding")
                        }else{
                            let product_details = productDetailStore.product_detail
                            ProductCardFullView(product: Product(
                                id          : product_details.id,
                                thumbnailUrl: product_details.thumbnailUrl,
                                title       : product_details.title,
                                introduction:product_details.introduction,
                                createdAt   : product_details.createdAt,
                                updatedAt   :product_details.updatedAt
                            )).id(1)
                            EachSectionCardView(
                                sectionType: .ideaSection,
                                content: product_details.ideaSection
                            ).id(2)
                            EachSectionCardView(
                                sectionType: .designSection,
                                content: product_details.designSection
                            ).id(3)
                            EachSectionCardView(
                                sectionType: .technologySection,
                                content: product_details.technologySection
                            ).id(4)
                            EachSectionCardView(
                                sectionType: .teamSection,
                                content: product_details.teamSection
                            ).id(5)
                        }
                    }
                }.task {
                    await productDetailStore.loadProduct(id: id)
                }
                .toolbar{
                    //toolbarの色を常に白に
                    ToolbarItemGroup(placement: .bottomBar) {
                        
                        Button(action: {
                            withAnimation (.default){
                                reader.scrollTo(1,anchor: .top)
                            }
                        },label:  {
                            Text("概要")
                                .foregroundColor(.black)
                                .underline(true,color: .gray)
                        })

                        Spacer()
                        
                        Button(action: {
                            withAnimation (.default){
                                reader.scrollTo(2,anchor: .top)
                            }
                        },label:  {
                            Text("アイデア")
                                .foregroundColor(.black)
                                .underline(true,color: .yellow)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation (.default){
                                reader.scrollTo(3,anchor: .top)
                            }
                        },label:  {
                            Text("デザイン")
                                .foregroundColor(.black)
                                .underline(true,color: .green)
                        })

                        Spacer()
                        
                        Button(action: {
                            withAnimation (.default){
                                reader.scrollTo(4,anchor: .top)
                            }
                        },label:  {
                            Text("技術")
                                .foregroundColor(.black)
                                .underline(true,color: .blue)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation (.default){
                                reader.scrollTo(5,anchor: .top)
                            }
                        },label:  {
                            Text("チーム")
                                .foregroundColor(.black)
                                .underline(true,color: .red)
                        })
                        
                        Spacer()

                    }
                }
            }
            .navigationTitle(title)
        }
    }
}
enum CardType {
    case ideaSection
    case designSection
    case technologySection
    case teamSection
}
