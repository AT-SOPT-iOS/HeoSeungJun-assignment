import UIKit

class MenuView: UIView {
    
    let homeButton = UIButton.create(title: "홈")
    let dramaButton = UIButton.create(title: "드라마")
    let entertainmentButton = UIButton.create(title: "예능")
    let movieButton = UIButton.create(title: "영화")
    let sportsButton = UIButton.create(title: "스포츠")
    let newsButton = UIButton.create(title: "뉴스")
    
    private lazy var menuButtonStackView = UIStackView()
    
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
        menuButtonStackView.addArrangedSubviews(homeButton, dramaButton, entertainmentButton,
                                                movieButton, sportsButton, newsButton)
        addSubview(menuButtonStackView)
    }
    
    private func setStyle() {
        menuButtonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 30
        }
    }
    
    private func setLayout() {
        menuButtonStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
    }
}
