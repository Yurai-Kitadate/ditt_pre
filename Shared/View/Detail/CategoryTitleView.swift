import SwiftUI
struct CategoryTitleView: View{
    let sectionType:CardType
    var body:some View{
        switch sectionType {
        case .designSection:
            HStack(alignment: .top){
                Image("design")
                VStack(alignment: .leading){
                    Text("Design").foregroundColor(myGreen)
                    Text("デザイン")
                }
            }
        case  .technologySection:
            HStack{
                Image("tech")
                VStack(alignment: .leading){
                    Text("Technology").foregroundColor(myBlue)
                    Text("技術")
                }
            }
        case .ideaSection:
            HStack{
                Image("idea")
                VStack(alignment: .leading){
                    Text("Idea").foregroundColor(myYellow)
                    Text("アイデア")
                }
            }
        default:
            HStack{
                Image("team")
                VStack(alignment: .leading){
                    Text("Team").foregroundColor(myRed)
                    Text("チーム")
                }
            }
        }
    }
}
