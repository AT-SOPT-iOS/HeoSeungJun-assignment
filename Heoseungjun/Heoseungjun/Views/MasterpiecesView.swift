import UIKit
import SnapKit

final class MasterpiecesView: UIView {
    
    private let masterpiecesManager = MasterpiecesManager()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 인생작 TOP 5"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 17)
        label.textAlignment = .left
        return label
    }()
    
    private let masterpieceCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.isPagingEnabled = true
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
        addSubViews(titleLabel, masterpieceCollectionView)
        
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
        masterpieceCollectionView.dataSource = self
        masterpieceCollectionView.delegate = self
    }
    
    private func setData() {
        masterpiecesManager.makeMasterpiecesData()
    }
    
    private func register() {
        masterpieceCollectionView.register(MasterpiecesCell.self, forCellWithReuseIdentifier: MasterpiecesCell.identifier)
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
