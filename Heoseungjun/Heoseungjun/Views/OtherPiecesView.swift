import UIKit
import SnapKit

final class OtherPiecesView: UIView {
    
    private let otherPiecesManager = OtherPiecesManager()
    
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var otherPiecesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
        otherPiecesCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addSubviews(otherPiecesCollectionView)
        
        otherPiecesCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).offset(15)
            $0.width.equalToSuperview()
            $0.height.equalTo(55)
        }
    }
    
    private func setDelegate() {
        otherPiecesCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(OtherPiecesCell.self, forCellWithReuseIdentifier: OtherPiecesCell.identifier)
        }
    }
    
    private func setData() {
        otherPiecesManager.makeOtherPiecesData()
    }
}

extension OtherPiecesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: collectionView.frame.height)
    }
}

extension OtherPiecesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherPiecesManager.getOhterPiecesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherPiecesCell.identifier, for: indexPath)
                as? OtherPiecesCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(otherPiecesManager.getOhterPiecesData()[indexPath.row])
        return cell
    }
}

