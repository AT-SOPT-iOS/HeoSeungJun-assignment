import UIKit
import SnapKit

final class BaseballTeamsCell: UICollectionViewCell {
    
    private let teamImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        teamImageView.contentMode = .scaleAspectFit
    }
    
    private func addView() {
        addSubview(teamImageView)
    }
    
    private func setLayout() {
        teamImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
    }
    
    func dataBind(_ data: BaseballTeams, row: Int) {
        teamImageView.image = data.image
        setBackgroundColor(row: row)
    }
    
    private func setBackgroundColor(row: Int) {
        if row % 2 == 0 {
            teamImageView.backgroundColor = .white
            return
        }
        teamImageView.backgroundColor = .black
    }
}

