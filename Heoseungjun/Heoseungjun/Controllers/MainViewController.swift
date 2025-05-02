import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let mainPiecesView = MainPiecesView()
    private let topPiecesView = TopPiecesView()
    private let realTimeLivesView = RealTimeLivesView()
    private let realTimeMoviesView = RealTimeMoviesView()
    private let baseballTemasView = BaseballTeamsView()
    private let otherPiecesView = OtherPiecesView()
    private let masterPiecesView = MasterpiecesView()
    private let footerView = FooterView()
    
    private let scrollView = UIScrollView()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
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
        hideBackButton()
        addViews()
        setLayout()
    }
    
    private func hideBackButton() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func addViews() {
        view.backgroundColor = .black
        contentStackView.addArrangedSubViews(
            mainPiecesView,
            topPiecesView,
            realTimeLivesView,
            realTimeMoviesView,
            baseballTemasView,
            otherPiecesView,
            masterPiecesView,
            footerView
        )
        scrollView.addSubview(contentStackView)
        view.addSubViews(navigationView, menuStackView, scrollView)
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }

        profileView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.height.equalTo(30)
        }

        searchImageView.snp.makeConstraints {
            $0.trailing.equalTo(profileView.snp.leading).offset(-16)
            $0.centerY.equalTo(navigationView.snp.centerY)
            $0.width.height.equalTo(30)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-40)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }

        menuStackView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(menuStackView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }

        mainPiecesView.snp.makeConstraints {
            $0.height.equalTo(400)
        }

        topPiecesView.snp.makeConstraints {
            $0.height.equalTo(174)
        }

        realTimeLivesView.snp.makeConstraints {
            $0.height.equalTo(173)
        }
        
        realTimeMoviesView.snp.makeConstraints {
            $0.height.equalTo(199)
        }
        
        baseballTemasView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        otherPiecesView.snp.makeConstraints {
            $0.height.equalTo(85)
        }
        
        masterPiecesView.snp.makeConstraints {
            $0.height.equalTo(153)
        }
        
        footerView.snp.makeConstraints {
            $0.height.equalTo(200)
            $0.bottom.equalTo(contentStackView.snp.bottom).inset(30)
        }
    }

}
