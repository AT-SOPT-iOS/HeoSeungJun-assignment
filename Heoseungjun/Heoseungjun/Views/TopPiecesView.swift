import UIKit

final class TopPiecesView: UIView {
    
    private let topPiecesManager = TopPiecesManager()
    
    private let topTwentyLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 17)
        label.textAlignment = .left
        return label
    }()
    
    private let topPiecesCollectionView: UICollectionView = {
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
        addSubViews(topTwentyLabel, topPiecesCollectionView)
        
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
        topPiecesCollectionView.dataSource = self
        topPiecesCollectionView.delegate = self
    }
    
    private func setData() {
        topPiecesManager.makeTopPiecesData()
    }
    
    private func register() {
        topPiecesCollectionView.register(TopPiecesCell.self, forCellWithReuseIdentifier: TopPiecesCell.identifier)
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
