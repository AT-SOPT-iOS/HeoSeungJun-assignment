import UIKit
import SnapKit

final class RealTimeLivesView: UIView {
    
    private let realTimeLivesManager = RealTimeLivesManager()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 LIVE"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 17)
        label.textAlignment = .left
        return label
    }()
    
    private let viewMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let liveCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        setDelegate()
        setData()
        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        addSubViews(titleLabel, viewMoreButton, liveCollectionView)
        
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
        liveCollectionView.dataSource = self
        liveCollectionView.delegate = self
    }
    
    private func setData() {
        realTimeLivesManager.makeRealTimeLivesData()
    }
    
    private func register() {
        liveCollectionView.register(RealTimeLivesCell.self, forCellWithReuseIdentifier: RealTimeLivesCell.identifier)
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
