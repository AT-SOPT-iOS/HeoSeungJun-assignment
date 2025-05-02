import UIKit
import SnapKit

final class OtherPiecesCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        //imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1)
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubview(imageView)
        
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

