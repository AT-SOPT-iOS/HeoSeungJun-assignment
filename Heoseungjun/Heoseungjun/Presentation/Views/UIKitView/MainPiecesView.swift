import UIKit

final class MainPiecesView: UIView {
    
    private let mainPiecesManager = MainPiecesManager()
        
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var mainPiecesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
        flowLayout.scrollDirection = .horizontal
        mainPiecesCollectionView.do {
            $0.backgroundColor = .clear
            $0.isPagingEnabled = true
        }
    }
    
    private func setLayout() {
        addSubview(mainPiecesCollectionView)
        
        mainPiecesCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(400)
        }
    }
    
    private func setDelegate() {
        mainPiecesCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(MainPiecesCell.self, forCellWithReuseIdentifier: MainPiecesCell.identifier)
        }
    }
    
    private func setData() {
        mainPiecesManager.makeMainPiecesData()
    }
}

extension MainPiecesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MainPiecesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainPiecesManager.getMainPiecesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPiecesCell.identifier, for: indexPath)
                as? MainPiecesCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(mainPiecesManager.getMainPiecesData()[indexPath.row])
        return cell
    }
}
