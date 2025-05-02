import UIKit
import SnapKit

final class BaseballTeamsCell: UICollectionViewCell {
    
    private let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        addSubview(teamImageView)
        
        teamImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
    }
    
    func dataBind(_ data: BaseballTeams, row: Int) {
        teamImageView.image = data.image?.scaleImage(toSize: CGSize(width: 25, height: 25))
        
        if row % 2 == 0 {
            teamImageView.backgroundColor = .white
            return
        }
        teamImageView.backgroundColor = .black
    }
}

