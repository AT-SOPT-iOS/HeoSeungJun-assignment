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
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        return label
    }()
    
    let backToMainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToMainButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func backToMainButtonTapped() {
        self.navigationController?.popViewController(animated: true)
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
        view.addSubview(tvingImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(backToMainButton)
    }
    
    private func activateConstraints() {
        tvingImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(tvingImageView.snp.width).multipliedBy(210.94 / 375)
        }

        welcomeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        backToMainButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.width.equalTo(335)
            make.height.equalTo(52)
            make.centerX.equalToSuperview()
        }
    }
    
    func setId(_ id: String) {
        self.id = id
    }
}
