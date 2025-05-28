import UIKit

class HeaderView: UIView {

    private let tvingImageView = UIImageView()
    private let searchImageView = UIImageView()
    private let profileImageView = UIImageView()
    private lazy var navigationView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        navigationView.addSubviews(tvingImageView, profileImageView, searchImageView)
        addSubview(navigationView)
    }
    
    private func setStyle() {
        tvingImageView.image = .tvingLogo
        searchImageView.image = .search.imageWithColor(color: .white)
        profileImageView.image = .profile
        navigationView.backgroundColor = .black
    }
    
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        tvingImageView.snp.makeConstraints {
            $0.leading.equalTo(navigationView.snp.leading)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }

        profileImageView.snp.makeConstraints {
            $0.trailing.equalTo(navigationView.snp.trailing).offset(-20)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.height.equalTo(30)
        }

        searchImageView.snp.makeConstraints {
            $0.trailing.equalTo(profileImageView.snp.leading).offset(-20)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.height.equalTo(30)
        }
    }
}
