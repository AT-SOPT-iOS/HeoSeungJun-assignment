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
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(mainPiecesImageView)
    }
    
    private func setLayout() {
        mainPiecesImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(577)
        }
    }
    
    func dataBind(_ mainPiecesData: MainPieces) {
        mainPiecesImageView.image = mainPiecesData.image
    }
}
