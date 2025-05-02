import UIKit
import SnapKit

final class MasterpiecesCell: UICollectionViewCell {
    
    private let pieceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(pieceImageView)
        
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

