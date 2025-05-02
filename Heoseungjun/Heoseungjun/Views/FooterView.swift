import UIKit
import SnapKit

final class FooterView: UIView {
    
    private let noticeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "공지"
        label.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
        label.font = UIFont(name: "Pretendard-Black", size: 14)
        return label
    }()
    
    private let introducteLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 계정 공유 정책 추가 안내"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Black", size: 14)
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "next")?.scaleImage(toSize: CGSize(width: 10, height: 10))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let otherInformationLabel: UILabel = {
        let label = UILabel()
        label.text = "고객문의·이용약관·개인정보처리방침\n사업자정보·인재채용"
        label.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        noticeView.addSubViews(noticeLabel, introducteLabel, nextButton)
        addSubViews(noticeView, otherInformationLabel)
        
        noticeView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.width.equalTo(347)
            $0.height.equalTo(100)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeView.snp.leading).inset(10)
            $0.centerY.equalTo(noticeView.snp.centerY)
        }
        
        introducteLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(5)
            $0.centerY.equalTo(noticeView.snp.centerY)
        }
        
        nextButton.snp.makeConstraints {
            $0.trailing.equalTo(noticeView.snp.trailing).inset(10)
            $0.centerY.equalTo(noticeView.snp.centerY)
        }
        
        otherInformationLabel.snp.makeConstraints {
            $0.top.equalTo(noticeView.snp.bottom).offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview()
        }
    }
}
