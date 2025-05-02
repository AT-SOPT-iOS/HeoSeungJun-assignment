import UIKit
import SnapKit

final class RealTimeLivesCell: UICollectionViewCell {
    
    private let pieceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 19)
        return label
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 10)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Thin", size: 10)
        return label
    }()
    
    private let viewerRatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Thin", size: 10)
        return label
    }()
    
    private let pieceInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubViews(pieceImageView, rankLabel, pieceInformationStackView)
        pieceInformationStackView.addArrangedSubViews(companyLabel, nameLabel, viewerRatingLabel)
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
