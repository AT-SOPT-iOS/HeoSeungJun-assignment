import UIKit
import SnapKit
import Then

final class BoxofficeView: UIView {
    
    private var boxofficeList: [DailyBoxOfficeList] = []
    
    private let headerView = HeaderView()
    private let boxofficeLabel = UILabel()
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var boxofficeCollectionView = UICollectionView(
        frame: .zero, collectionViewLayout: collectionViewLayout
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegate()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegate() {
        boxofficeCollectionView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(BoxofficeRankCell.self, forCellWithReuseIdentifier: BoxofficeRankCell.identifier)
        }
    }
    
    private func setStyle() {
        boxofficeLabel.do {
            $0.text = "일별 박스오피스 순위"
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 19)
        }
        
        collectionViewLayout.scrollDirection = .horizontal
        boxofficeCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addViews()
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        boxofficeLabel.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(30)
        }
        
        boxofficeCollectionView.snp.makeConstraints {
            $0.top.equalTo(boxofficeLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(350)
        }
    }
    
    private func addViews() {
        addSubviews(headerView, boxofficeLabel, boxofficeCollectionView)
    }
    
    func setDailyList(_ boxofficeList: [DailyBoxOfficeList]) {
        self.boxofficeList = boxofficeList
        boxofficeCollectionView.reloadData()
    }
}

extension BoxofficeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sideInset = (collectionView.frame.width - 350) / 2
        return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
}

extension BoxofficeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boxofficeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxofficeRankCell.identifier, for: indexPath)
                as? BoxofficeRankCell else {
            return UICollectionViewCell()
        }
        let data = boxofficeList[indexPath.row]
        cell.dataBind(data: data)
        return cell
    }
}
