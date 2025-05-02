import UIKit
import SnapKit

class MainPiecesCell: UICollectionViewCell {
        
    private let mainPiecesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
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
        contentView.addSubview(mainPiecesImageView)
        
        mainPiecesImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func dataBind(_ mainPiecesData: MainPieces) {
        mainPiecesImageView.image = mainPiecesData.image
    }
}
