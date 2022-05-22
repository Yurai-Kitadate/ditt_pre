import SwiftUI
struct TitleView: View {
    var body: some View {
        VStack{
            
            NavigationView{
                NavigationLink(destination:MainView()){
                    Text("Hello, ditt!")
                }
            }
        }
    }
}
