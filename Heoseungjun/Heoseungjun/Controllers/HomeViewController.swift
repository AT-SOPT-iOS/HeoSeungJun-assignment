import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let headerView = HeaderView()
    private let menuView = MenuView()
        
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
        contentStackView.addArrangedSubviews(
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
        view.addSubviews(headerView, menuView, scrollView)
    }
    
    private func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }

        menuView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(27)
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(menuView.snp.bottom).offset(20)
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
