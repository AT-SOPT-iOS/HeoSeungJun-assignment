import UIKit
import SnapKit

final class FooterView: UIView {
    
    private let noticeView = UIView()
    private let noticeLabel = UILabel()
    private let introduceLabel = UILabel()
    private let nextButton = UIButton()
    private let otherInformationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        noticeView.do {
            $0.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
            $0.layer.cornerRadius = 5
        }
        
        noticeLabel.do {
            $0.text = "공지"
            $0.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
            $0.font = UIFont.customBold(ofSize: 14)
        }
        
        introduceLabel.do {
            $0.text = "티빙 계정 공유 정책 추가 안내"
            $0.textColor = .white
            $0.font = UIFont.customBlack(ofSize: 14)
        }
        
        nextButton.do {
            let image = UIImage(named: "next")?.scaleImage(toSize: CGSize(width: 10, height: 10))
            $0.setImage(image, for: .normal)
        }
        
        otherInformationLabel.do {
            $0.text = "고객문의·이용약관·개인정보처리방침\n사업자정보·인재채용"
            $0.textColor = UIColor.gray4
            $0.numberOfLines = 3
        }
    }
    
    private func setLayout() {
        noticeView.addSubviews(noticeLabel, introduceLabel, nextButton)
        addSubviews(noticeView, otherInformationLabel)
        
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
        
        introduceLabel.snp.makeConstraints {
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
