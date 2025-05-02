import UIKit
import SnapKit

final class RealTimeMoviesView: UIView {
    
    private let realTimeMoviesManager = RealTimeMoviesManager()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 영화"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 17)
        label.textAlignment = .left
        return label
    }()
    
    private let viewMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    private let movieCollectionView: UICollectionView = {
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
        addSubViews(titleLabel, viewMoreButton, movieCollectionView)
        
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
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
    }
    
    private func setData() {
        realTimeMoviesManager.makeRealTimeMoviesData()
    }
    
    private func register() {
        movieCollectionView.register(RealTimeMoviesCell.self, forCellWithReuseIdentifier: RealTimeMoviesCell.identifier)
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
