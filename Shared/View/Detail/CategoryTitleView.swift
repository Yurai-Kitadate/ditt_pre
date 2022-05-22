import SwiftUI
struct CategoryTitleView: View{
    let sectionType:CardType
    var body:some View{
        if sectionType == .designSection{
            HStack(alignment: .top){
                Image("idea")
                VStack(alignment: .leading){
                    Text("Design")
                    Text("デザイン")
                }
            }
        }
        if sectionType == .technologySection{
            HStack{
                Image("idea")
                VStack(alignment: .leading){
                    Text("Technology")
                    Text("技術")
                }
            }
        }
        if sectionType == .ideaSection{
            HStack{
                Image("idea")
                VStack(alignment: .leading){
                    Text("Idea").foregroundColor(Color(red: 0.975, green: 0.702, blue: 0))
                    Text("アイデア")
                }
            }
        }
        if sectionType == .teamSection{
            HStack{
                Image("idea")
                VStack(alignment: .leading){
                    Text("Team")
                    Text("チーム")
                }
            }
        }
    }
}
