import SwiftUI
struct CategoryTitleView: View{
    let sectionType:CardType
    //let screen: CGSize = UIScreen.main.bounds
    var body:some View{
        if sectionType == .designSection{
            HStack(alignment: .top){
                Image("design")
                VStack(alignment: .leading){
                    Text("Design").foregroundColor(myGreen)
                    Text("デザイン")
                }
            }
        }
        if sectionType == .technologySection{
            HStack{
                Image("tech")
                VStack(alignment: .leading){
                    Text("Technology").foregroundColor(myBlue)
                    Text("技術")
                }
            }
        }
        if sectionType == .ideaSection{
            HStack{
                Image("idea")
                VStack(alignment: .leading){
                    Text("Idea").foregroundColor(myYellow)
                    Text("アイデア")
                }
            }
        }
        if sectionType == .teamSection{
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
