import SwiftUI
struct CategoryTitleView: View{
    let sectionType:CardType
    //let screen: CGSize = UIScreen.main.bounds
    var body:some View{
        if sectionType == .designSection{
            HStack(alignment: .top){
                Image("design")
                VStack(alignment: .leading){
                    Text("Design").foregroundColor(Color(red: 4.0/255, green: 220/225, blue: 90/255))
                    Text("デザイン")
                }
            }
        }
        if sectionType == .technologySection{
            HStack{
                Image("tech")
                VStack(alignment: .leading){
                    Text("Technology").foregroundColor(Color(red: 33.0/255, green: 149/225, blue: 255/255))
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
                Image("team")
                VStack(alignment: .leading){
                    Text("Team").foregroundColor(Color(red: 242.0/255, green: 49.0/255, blue: 130.0/255))
                    Text("チーム")
                }
            }
        }
    }
}
