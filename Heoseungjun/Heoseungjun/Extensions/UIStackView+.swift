import UIKit

extension UIStackView {
    func addArrangedSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
