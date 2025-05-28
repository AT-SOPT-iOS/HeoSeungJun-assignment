import UIKit
import SnapKit

final class BaseballTeamsView: UIView {
    
    private let baseballTeamsManager = BaseballTeamsManager()
    
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var baseballCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
        baseballCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addSubviews(baseballCollectionView)
        
        baseballCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func setDelegate() {
        baseballCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(BaseballTeamsCell.self, forCellWithReuseIdentifier: BaseballTeamsCell.identifier)
        }
    }
    
    private func setData() {
        baseballTeamsManager.makeBaseballTeamsData()
    }
}

extension BaseballTeamsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: collectionView.frame.height)
    }
}

extension BaseballTeamsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseballTeamsManager.getBaseballTeamsData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseballTeamsCell.identifier, for: indexPath)
                as? BaseballTeamsCell else {
            return UICollectionViewCell()
        }
        let row = indexPath.row
        cell.dataBind(baseballTeamsManager.getBaseballTeamsData()[row], row: row)
        return cell
    }
}

