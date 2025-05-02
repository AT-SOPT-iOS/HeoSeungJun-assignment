import UIKit
import SnapKit

class MainViewController: UIViewController {

    private let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvingLogo")
        return imageView
    }()
    
    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        let searchImage = UIImage(named: "search")
        imageView.image = searchImage?.imageWithColor(color: .white)
        return imageView
    }()
    
    private let profileView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.addSubViews(tvingImageView, searchImageView, profileView)
        return view
    }()
    
    private let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "홈"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private let dramaLabel: UILabel = {
        let label = UILabel()
        label.text = "드라마"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private let entertainmentLabel: UILabel = {
        let label = UILabel()
        label.text = "예능"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.text = "영화"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private let sportsLabel: UILabel = {
        let label = UILabel()
        label.text = "스포츠"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "뉴스"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 17)
        return label
    }()
    
    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubViews(homeLabel, dramaLabel, entertainmentLabel, movieLabel, sportsLabel, newsLabel)
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
    }
    
    private func setLayout() {
        view.backgroundColor = .black
        view.addSubview(navigationView)
        view.addSubview(menuStackView)
    }
    
    private func setConstraints() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(50)
            $0.leading.equalTo(view.snp.leading)
            $0.height.equalTo(71)
        }
        
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.width.equalTo(191)
            $0.height.equalTo(71)
        }
        
        profileView.snp.makeConstraints {
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.centerY.equalTo(tvingImageView.snp.centerY)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        searchImageView.snp.makeConstraints {
            $0.trailing.equalTo(profileView.snp.leading).offset(-12)
            $0.centerY.equalTo(tvingImageView.snp.centerY)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(10)
            $0.centerX.equalTo(view.snp.centerX)
            $0.height.equalTo(27)
        }
    }
    
}
