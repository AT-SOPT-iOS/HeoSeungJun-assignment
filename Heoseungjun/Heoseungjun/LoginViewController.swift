import UIKit
import SnapKit

final class LoginViewController: UIViewController {
        
    private lazy var clearButtonImage = createImage("clear.png")
    private lazy var eyeSlashImage = createImage("eye.slash.png")
    private lazy var eyeImage = createImage("eye.png")
    
    private var nickname: String?
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        label.textColor = UIColor(red: 214, green: 214, blue: 214, alpha: 1)
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        textField.font = UIFont(name: "Pretendard-Black", size: 15)
        textField.layer.cornerRadius = 3
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "아이디",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)]
        )
        textField.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(textFieldTapped), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
        textField.font = UIFont(name: "Pretendard-Black", size: 15)
        textField.layer.cornerRadius = 3
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 52))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)]
        )
        textField.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.addTarget(self, action: #selector(textFieldTapped), for: .editingChanged)
        return textField
    }()
    
    private lazy var idClearButton: UIButton = {
        let button = UIButton()
        button.setImage(clearButtonImage, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(idClearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordSecureButton: UIButton = {
        let button = UIButton()
        button.setImage(eyeSlashImage, for: .normal)
        button.addTarget(self, action: #selector(passwordSecureButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordClearButton: UIButton = {
        let button = UIButton()
        button.setImage(clearButtonImage, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(passwordClearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Black", size: 14)
        button.titleLabel?.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var idFoundButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1), for: .normal)
        return button
    }()
    
    private lazy var verticalLine: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.textColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)
        label.font = UIFont(name: "Pretendard-Bold", size: 14)
        return label
    }()
    
    private lazy var passwordFoundButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1), for: .normal)
        return button
    }()
    
    private lazy var foundStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [idFoundButton, verticalLine, passwordFoundButton])
        view.spacing = 15
        view.axis = .horizontal
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("아직 계정이 없으신가요?", for: .normal)
        button.setTitleColor(UIColor(red: 0.38, green: 0.38, blue: 0.38, alpha: 1), for: .normal)
        return button
    }()
    
    private lazy var makeNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1), for: .normal)
        button.setUnderline()
        button.addTarget(self, action: #selector(makeNicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var accountStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [signUpButton, makeNicknameButton])
        view.spacing = 20
        view.axis = .horizontal
        return view
    }()
    
    private func createImage(_ name: String) -> UIImage? {
        return UIImage(named: name)?.imageWithColor(color: .lightGray)
    }
    
    // ⭐️
    @objc func textFieldTapped() {
        let idIsEmpty = idTextField.text?.isEmpty ?? true
        let passwordIsEmpty = passwordTextField.text?.isEmpty ?? true

        idClearButton.isHidden = idIsEmpty
        passwordClearButton.isHidden = passwordIsEmpty

        if idIsEmpty || passwordIsEmpty {
            inactivateLoginButton()
            return
        }
        activateLoginButton()
    }

    
    private func inactivateLoginButton() {
        loginButton.isEnabled = false
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.backgroundColor = .black
    }
    
    private func activateLoginButton() {
        loginButton.isEnabled = true
        loginButton.layer.borderWidth = 0
        loginButton.backgroundColor = .red
    }
    
    @objc func idClearButtonTapped() {
        idTextField.text = ""
        idClearButton.isHidden = true
    }
    
    @objc func passwordClearButtonTapped() {
        passwordTextField.text = ""
        passwordClearButton.isHidden = true
    }
    
    @objc func passwordSecureButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle()
        passwordSecureButton.setImage(passwordTextField.isSecureTextEntry ? eyeSlashImage : eyeImage, for: .normal)
    }
    
    // ⭐️
    @objc func loginButtonTapped() {
        let welcomeController = WelcomeViewController()
        
        guard let id = idTextField.text, id.isValidEmail,
              let password = passwordTextField.text, password.isValidPassword else {
            showLoginFailedModal()
            return
        }
        let result = nickname ?? idTextField.text!
        welcomeController.setId(result)
        
        self.navigationController?.pushViewController(welcomeController, animated: true)
    }
    
    private func showLoginFailedModal() {
        let alert = UIAlertController(title: "로그인 실패", message: "입력하신 회원정보를 찾을 수 없습니다.\n아이디, 비밀번호를 다시 확인해주세요", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        
        present(alert, animated: true)
    }
    
    // ⭐️
    @objc func makeNicknameButtonTapped() {
        let viewController = SetNicknameViewController()
        viewController.delegate = self
        
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(viewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        configureUI()
    }
    
    private func setDelegates() {
        idTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func configureUI() {
        view.backgroundColor = .black
        //turnOffAutoResizingMask()
        addSubViews()
        activateConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(mainLabel)
        view.addSubview(idTextField)
        view.addSubview(idClearButton)
        view.addSubview(passwordTextField)
        view.addSubview(passwordSecureButton)
        view.addSubview(passwordClearButton)
        view.addSubview(loginButton)
        view.addSubview(foundStackView)
        view.addSubview(accountStackView)
    }
    
    private func activateConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
        }

        idTextField.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(52)
        }

        idClearButton.snp.makeConstraints { make in
            make.centerY.equalTo(idTextField)
            make.trailing.equalTo(idTextField.snp.trailing).offset(-12)
            make.width.height.equalTo(20)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(52)
        }

        passwordSecureButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-44)
            make.width.height.equalTo(20)
        }

        passwordClearButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.trailing.equalTo(passwordTextField.snp.trailing).offset(-12)
            make.width.height.equalTo(20)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(52)
        }

        foundStackView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        accountStackView.snp.makeConstraints { make in
            make.top.equalTo(foundStackView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
}

extension LoginViewController: NicknameDelegate {
    func bindNickname(_ nickname: String) {
        self.nickname = nickname
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderWidth = 1
            idTextField.layer.borderColor = UIColor.white.cgColor
        }
        
        if textField == passwordTextField {
            passwordTextField.layer.borderWidth = 1
            passwordTextField.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idTextField.layer.borderWidth = 0
        }
        
        if textField == passwordTextField {
            passwordTextField.layer.borderWidth = 0
        }
    }
}

extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}

extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}

extension String {
    var isValidEmail: Bool {
        let regularExpression = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let regularExpression = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
