import UIKit
import SnapKit

class DramaView: UIView {
    
    private let viewNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Drama View"
        label.font = UIFont.customRegular(ofSize: 23)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        viewNameLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
