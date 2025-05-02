import UIKit

final class TopPiecesManagerView: UIView {
    
    private let topPiecesManager = TopPiecesManager()

    private let topTwentyLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    private let topPiecesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
    }

    private func setData() {
        topPiecesManager.makeTopPiecesData()
    }
    
    private func setDelegate() {
        topPiecesCollectionView.dataSource = self
        topPiecesCollectionView.delegate = self
    }
    
    private func register() {
        topPiecesCollectionView.register(TopPiecesCell.self, forCellWithReuseIdentifier: TopPiecesCell.identifier)
    }
}

extension TopPiecesManagerView: UICollectionViewDelegateFlowLayout {
    
}

extension TopPiecesManagerView: UICollectionViewDataSource {
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
