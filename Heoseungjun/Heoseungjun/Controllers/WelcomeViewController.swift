import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    private var id: String?
    
    let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tving")
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "\(id!)님\n\n반가워요!"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.customBold(ofSize: 23)
        return label
    }()
    
    let goToMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(goToMainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let goToBoxofficeButton: UIButton = {
        let button = UIButton()
        button.setTitle("일별 박스오피스", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(goToBoxofficeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func goToMainButtonTapped() {
        let homeVC = HomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @objc func goToBoxofficeButtonTapped() {
        let boxofficeVC = BoxofficeViewController()
        self.navigationController?.pushViewController(boxofficeVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        addSubViews()
        activateConstraints()
    }
    
    private func addSubViews() {
        view.backgroundColor = .black
        view.addSubviews(tvingImageView, welcomeLabel, goToBoxofficeButton, goToMainButton)
    }
    
    private func activateConstraints() {
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(tvingImageView.snp.width).multipliedBy(210.94 / 375)
        }

        welcomeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        goToBoxofficeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(92)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }

        goToMainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setId(_ id: String) {
        self.id = id
    }
}
