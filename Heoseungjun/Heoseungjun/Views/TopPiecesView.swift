import UIKit

final class TopPiecesView: UIView {
    
    private let topPiecesManager = TopPiecesManager()
    
    private let topTwentyLabel = UILabel()
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var topPiecesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
        topTwentyLabel.do {
            $0.text = "오늘의 티빙 TOP 20"
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 17)
            $0.textAlignment = .left
        }
        
        flowLayout.scrollDirection = .horizontal
        topPiecesCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addSubviews(topTwentyLabel, topPiecesCollectionView)
        
        topTwentyLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalTo(23)
        }
        
        topPiecesCollectionView.snp.makeConstraints {
            $0.top.equalTo(topTwentyLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(146)
        }
    }
    
    private func setDelegate() {
        topPiecesCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(TopPiecesCell.self, forCellWithReuseIdentifier: TopPiecesCell.identifier)
        }
    }
    
    private func setData() {
        topPiecesManager.makeTopPiecesData()
    }
}

extension TopPiecesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension TopPiecesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topPiecesManager.getTopPiecesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopPiecesCell.identifier, for: indexPath)
                as? TopPiecesCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(topPiecesManager.topPiecesData[indexPath.row])
        return cell
    }
}
