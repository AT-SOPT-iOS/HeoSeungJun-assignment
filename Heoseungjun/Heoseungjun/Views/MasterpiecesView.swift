import UIKit
import SnapKit

final class MasterpiecesView: UIView {
    
    private let masterpiecesManager = MasterpiecesManager()
    
    private let titleLabel = UILabel()
    
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var masterpieceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
            $0.text = "나의 인생작 TOP 5"
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 17)
            $0.textAlignment = .left
        }
        
        flowLayout.scrollDirection = .horizontal
        masterpieceCollectionView.do {
            $0.backgroundColor = .black
            $0.isPagingEnabled = true
        }
    }
    
    private func setLayout() {
        addSubviews(titleLabel, masterpieceCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(13)
            $0.width.equalTo(130)
            $0.height.equalTo(23)
        }
        
        masterpieceCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
    
    private func setDelegate() {
        masterpieceCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(MasterpiecesCell.self, forCellWithReuseIdentifier: MasterpiecesCell.identifier)
        }
    }
    
    private func setData() {
        masterpiecesManager.makeMasterpiecesData()
    }
}

extension MasterpiecesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: collectionView.frame.height)
    }
}

extension MasterpiecesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masterpiecesManager.getMasterpicesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MasterpiecesCell.identifier, for: indexPath)
                as? MasterpiecesCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(masterpiecesManager.getMasterpicesData()[indexPath.row])
        return cell
    }
}
