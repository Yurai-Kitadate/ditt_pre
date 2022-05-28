import SwiftUI
struct CornerRadiusView: UIViewRepresentable {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask
    //https://www.hackingwithswift.com/example-code/calayer/how-to-round-only-specific-corners-using-maskedcorners
    func makeUIView(context: UIViewRepresentableContext<CornerRadiusView>) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = cornerRadius
        view.layer.maskedCorners = maskedCorners
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<CornerRadiusView>) {
    }
}
struct CornerRadiusModifier: ViewModifier {
    let cornerRadius: CGFloat
    let maskedCorners: CACornerMask
    func body(content: Content) -> some View {
        content.mask(CornerRadiusView(cornerRadius: self.cornerRadius, maskedCorners: self.maskedCorners))
    }
}
