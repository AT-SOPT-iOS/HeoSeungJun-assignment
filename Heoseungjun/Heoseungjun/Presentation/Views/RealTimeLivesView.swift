import UIKit
import SnapKit

final class RealTimeLivesView: UIView {
    
    private let realTimeLivesManager = RealTimeLivesManager()
    
    private let titleLabel = UILabel()
    private let viewMoreButton = UIButton()
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var liveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setLayout()
        setDelegate()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.text = "실시간 인기 LIVE"
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 17)
            $0.textAlignment = .left
        }
        
        viewMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.systemGray, for: .normal)
            $0.backgroundColor = .clear
        }
        
        flowLayout.scrollDirection = .horizontal
        liveCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addSubviews(titleLabel, viewMoreButton, liveCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(13)
            $0.width.equalTo(120)
            $0.height.equalTo(23)
        }
        
        viewMoreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(150)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(105)
            $0.height.equalTo(23)
        }
        
        liveCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(150)
        }
    }
    
    private func setDelegate() {
        liveCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(RealTimeLivesCell.self, forCellWithReuseIdentifier: RealTimeLivesCell.identifier)
        }
    }
    
    private func setData() {
        realTimeLivesManager.makeRealTimeLivesData()
    }
}

extension RealTimeLivesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension RealTimeLivesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realTimeLivesManager.getRealTimeLivesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimeLivesCell.identifier, for: indexPath)
                as? RealTimeLivesCell else {
            return UICollectionViewCell()
        }
        let row = indexPath.row
        cell.dataBind(realTimeLivesManager.getRealTimeLivesData()[row], row: row)
        return cell
    }
}
