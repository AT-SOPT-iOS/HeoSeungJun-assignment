import UIKit
import SnapKit

final class MasterpiecesCell: UICollectionViewCell {
    
    private let pieceImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(pieceImageView)
    }
    
    private func setStyle() {
        pieceImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout() {
        pieceImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
    
    func dataBind(_ data: Masterpieces) {
        pieceImageView.image = data.image
    }
}

