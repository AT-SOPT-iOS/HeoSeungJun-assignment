import UIKit
import SnapKit

final class OtherPiecesCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(imageView)
    }
    
    private func setStyle() {
        imageView.do {
            $0.backgroundColor = UIColor.gray1
            $0.layer.cornerRadius = 4
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(55)
        }
    }
    
    func dataBind(_ data: OtherPieces) {
        imageView.image = data.image?.scaleImage(toSize: CGSize(width: 68, height: 34))
    }
}

