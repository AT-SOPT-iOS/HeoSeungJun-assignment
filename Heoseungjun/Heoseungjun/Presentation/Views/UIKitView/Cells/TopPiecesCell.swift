import UIKit
import SnapKit

class TopPiecesCell: UICollectionViewCell {
    
    private let rankLabel = UILabel()
    private let topPiecesImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubviews(topPiecesImageView, rankLabel)
    }
    
    private func setStyle() {
        rankLabel.do {
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 50)
        }
        
        topPiecesImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 3
        }
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview()
        }

        topPiecesImageView.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(30)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(146)
        }
    }
    
    func dataBind(_ topPiecesData: TopPieces) {
        rankLabel.text = String(topPiecesData.rank)
        topPiecesImageView.image = topPiecesData.image
    }
}
