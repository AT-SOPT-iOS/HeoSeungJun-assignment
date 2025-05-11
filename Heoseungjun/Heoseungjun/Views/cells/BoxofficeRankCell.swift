import UIKit
import SnapKit
import Then

final class BoxofficeRankCell: UICollectionViewCell {
    
    private lazy var movieCardView = UIView()
    private let rankLabel = UILabel()
    private let movieNameLabel = UILabel()
    private let audienceCountLabel = UILabel()
    private let oldAndNewLabel = UILabel()
    
    private lazy var movieInfoStackView = UIStackView()
    
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
        movieInfoStackView.addArrangedSubviews(movieNameLabel, audienceCountLabel, oldAndNewLabel)
        movieCardView.addSubviews(rankLabel, movieInfoStackView)
        addSubviews(movieCardView, movieInfoStackView)
    }
    
    private func setStyle() {
        movieCardView.do {
            $0.backgroundColor = .white
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 15
        }
        
        rankLabel.do {
            $0.textColor = .black
            //$0.font = UIFont.customBold(ofSize: 40)
            $0.font = UIFont.italicSystemFont(ofSize: 40)
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = true
            $0.textAlignment = .center
        }
        
        movieNameLabel.do {
            $0.textColor = .black
            $0.font = UIFont.customBold(ofSize: 23)
            $0.textAlignment = .center
        }
        
        audienceCountLabel.do {
            $0.textColor = .systemGray
            $0.font = UIFont.customRegular(ofSize: 19)
            $0.textAlignment = .center
        }
        
        oldAndNewLabel.do {
            $0.textColor = .systemOrange
            $0.font = UIFont.customSemiBold(ofSize: 19)
            $0.textAlignment = .center
        }
        
        movieInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
        }
    }
    
    private func setLayout() {
        movieCardView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview()
            $0.height.equalTo(250)
            $0.width.equalTo(350)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(movieCardView.snp.top).inset(20)
            $0.leading.equalTo(movieCardView.snp.leading).inset(20)
            $0.height.equalTo(40)
        }
        
        movieInfoStackView.snp.makeConstraints {
            $0.top.equalTo(movieCardView.snp.top).inset(50)
            $0.centerX.equalTo(movieCardView.snp.centerX)
            $0.centerY.equalTo(movieCardView.snp.centerY)
            $0.height.equalTo(250)
            $0.width.equalTo(200)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
        
        audienceCountLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
        
        oldAndNewLabel.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(200)
        }
    }
    
    func dataBind(data: DailyBoxOfficeList) {
        rankLabel.text = data.rank
        movieNameLabel.text = data.movieNm
        audienceCountLabel.text = data.audiAcc.expressAttendance()
        if data.rankOldAndNew == "NEW" {
            oldAndNewLabel.text = data.rankOldAndNew
        }
    }
}
