import SwiftUI
struct TitleView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("Logo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                NavigationLink(destination:MainView()){
                    Text("Start")
                }
            }
        }
    }
}
