import UIKit
import SnapKit

protocol NicknameDelegate: AnyObject {
    func bindNickname(_ nickname: String)
}

final class SetNicknameViewController: UIViewController {
    
    // ❤️ 텍스트필드 입력은 한글로 제한
    
    weak var delegate: NicknameDelegate?
    
    private let enterNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .black
        label.font = UIFont(name: "Prentendard-Black", size: 23)
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        textField.textColor = .black
        textField.layer.cornerRadius = 3
        textField.autocapitalizationType = .none
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(nicknameTextFieldTapped), for: .editingChanged)
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func nicknameTextFieldTapped() {
        guard let text = nicknameTextField.text, !text.isEmpty else {
            saveButton.isEnabled = false
            saveButton.backgroundColor = .black
            return
        }
        saveButton.isEnabled = true
        saveButton.backgroundColor = .red
    }
    
    @objc func saveButtonTapped() {
        guard let nickname = nicknameTextField.text, nickname.isValidNickname else {
            showLoginFailedModal()
            return
        }

        delegate?.bindNickname(nickname)
        dismiss(animated: true)
    }
    
    private func showLoginFailedModal() {
        let alert = UIAlertController(title: "닉네임 설정 실패", message: "닉네임은 한글로 입력해주세요", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        addSubViews()
        activateConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(enterNicknameLabel)
        view.addSubview(nicknameTextField)
        view.addSubview(saveButton)
    }
    
    private func activateConstraints() {
        enterNicknameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30) // trailing은 offset이 아니라 inset!
        }

        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(enterNicknameLabel.snp.bottom).offset(10)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }

        saveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(30)
            $0.width.equalTo(335)
            $0.height.equalTo(63.13)
            $0.centerX.equalToSuperview()
        }
    }
}

extension String {
    var isValidNickname: Bool {
        let regularExpression = "^[가-힣]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
