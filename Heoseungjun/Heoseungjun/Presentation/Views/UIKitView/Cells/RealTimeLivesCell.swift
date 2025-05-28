import UIKit
import SnapKit
import Then

final class RealTimeLivesCell: UICollectionViewCell {
    
    private let pieceImageView = UIImageView()
    private let rankLabel = UILabel()
    private let companyLabel = UILabel()
    private let nameLabel = UILabel()
    private let viewerRatingLabel = UILabel()
    private let pieceInformationStackView = UIStackView()
    
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
        addSubviews(pieceImageView, rankLabel, pieceInformationStackView)
        pieceInformationStackView.addArrangedSubviews(companyLabel, nameLabel, viewerRatingLabel)
    }
    
    private func setStyle() {
        pieceImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 3
        }
        
        rankLabel.do {
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 19)
        }
        
        companyLabel.do {
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 10)
        }
        
        nameLabel.do {
            $0.textColor = .white
            $0.font = UIFont.customThin(ofSize: 10)
        }
        
        viewerRatingLabel.do {
            $0.textColor = .white
            $0.font = UIFont.customThin(ofSize: 10)
        }
        
        pieceInformationStackView.do {
            $0.axis = .vertical
            $0.spacing = 1
            $0.alignment = .leading
        }
    }
    
    private func setLayout() {
        pieceImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(pieceImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(12)
            $0.height.equalTo(30)
        }
        
        companyLabel.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        viewerRatingLabel.snp.makeConstraints {
            $0.height.equalTo(16)
        }
        
        pieceInformationStackView.snp.makeConstraints {
            $0.top.equalTo(pieceImageView.snp.bottom).offset(10)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.width.equalTo(135)
            $0.height.equalTo(50)
        }
    }
    
    func dataBind(_ data: RealTimeLives, row: Int) {
        pieceImageView.image = data.image
        rankLabel.text = "\(row + 1)"
        companyLabel.text = data.company
        nameLabel.text = data.name
        viewerRatingLabel.text = "\(data.viewerRating)%"
    }
}
