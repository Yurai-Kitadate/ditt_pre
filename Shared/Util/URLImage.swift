import SwiftUI

struct URLImage: View {
    let screen: CGRect = UIScreen.main.bounds
    let url: String
    @ObservedObject private var imageDownloader = ImageDownloader()

    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }

    var body: some View {
        if let imageData = self.imageDownloader.downloadData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img!)
                    .resizable()
                    .scaledToFill()
                    .frame(width:screen.width/1.05, height: 250)
                    .cornerRadius(5)
            }
        } else {
            return VStack {
                Image("no_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width:screen.width/1.05, height: 250)
                    .cornerRadius(5)
            }
        }
    }
}
