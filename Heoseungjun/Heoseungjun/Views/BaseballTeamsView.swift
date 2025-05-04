import UIKit
import SnapKit

final class BaseballTeamsView: UIView {
    
    private let baseballTeamsManager = BaseballTeamsManager()
    
    private let baseballCollectionView: UICollectionView = {
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
        addSubViews(baseballCollectionView)
        
        baseballCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
    
    private func setDelegate() {
        baseballCollectionView.dataSource = self
        baseballCollectionView.delegate = self
    }
    
    private func setData() {
        baseballTeamsManager.makeBaseballTeamsData()
    }
    
    private func register() {
        baseballCollectionView.register(BaseballTeamsCell.self, forCellWithReuseIdentifier: BaseballTeamsCell.identifier)
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

