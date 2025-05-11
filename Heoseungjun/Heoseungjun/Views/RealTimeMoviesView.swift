import UIKit
import SnapKit

final class RealTimeMoviesView: UIView {
    
    private let realTimeMoviesManager = RealTimeMoviesManager()
    
    private let titleLabel = UILabel()
    private let viewMoreButton = UIButton()
    private let flowLayout = UICollectionViewFlowLayout()
    private lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    
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
            $0.text = "실시간 인기 영화"
            $0.textColor = .white
            $0.font = UIFont.customBold(ofSize: 17)
            $0.textAlignment = .left
        }
        
        viewMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.systemGray, for: .normal)
            $0.backgroundColor = .clear
        }
        
        flowLayout.scrollDirection = .horizontal
        movieCollectionView.backgroundColor = .black
    }
    
    private func setLayout() {
        addSubviews(titleLabel, viewMoreButton, movieCollectionView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(13)
            $0.width.equalTo(120)
            $0.height.equalTo(23)
        }
        
        viewMoreButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(150)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(105)
            $0.height.equalTo(23)
        }
        
        movieCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    
    private func setDelegate() {
        movieCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(RealTimeMoviesCell.self, forCellWithReuseIdentifier: RealTimeMoviesCell.identifier)
        }
    }
    
    private func setData() {
        realTimeMoviesManager.makeRealTimeMoviesData()
    }
}

extension RealTimeMoviesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 98, height: collectionView.frame.height)
    }
}

extension RealTimeMoviesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realTimeMoviesManager.getRealTimeMoviesData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RealTimeMoviesCell.identifier, for: indexPath)
                as? RealTimeMoviesCell else {
            return UICollectionViewCell()
        }
        cell.dataBind(realTimeMoviesManager.getRealTimeMoviesData()[indexPath.row])
        return cell
    }
}
