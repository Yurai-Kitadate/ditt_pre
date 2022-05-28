import SwiftUI
struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.mask(CornerRadiusView(cornerRadius: self.cornerRadius, maskedCorners: self.maskedCorners))
    }
}

