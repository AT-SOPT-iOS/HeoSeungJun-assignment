import UIKit
import SnapKit

extension UIView {
    func addSubViews(_ subViews: UIView...) {
        subViews.forEach { addSubview($0) }
    }
}
