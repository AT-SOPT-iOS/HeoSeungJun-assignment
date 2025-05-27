import UIKit
import SnapKit
import Then

class BoxofficeViewController: UIViewController {
    
    private let movieInfoUrlString = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
    private let key = "2439a9bdfcefc1fae47a3efe66b28d4f"
    private lazy var targetDt = getTargetDate()
    private let totalRank = 10
    
    private let boxofficeView = BoxofficeView()
    
    override func loadView() {
        view = boxofficeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setBoxOfficeList()
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func getTargetDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date.yesterday)
    }
    
    private func setBoxOfficeList() {
        Task {
            do {
                let dailyList = try await fetchBoxOfficeList()
                boxofficeView.setDailyList(dailyList)
            } catch {
                throw NetworkError.unknownError
            }
        }
    }
}

extension BoxofficeViewController {
    
    private func fetchBoxOfficeList() async throws -> [DailyBoxOfficeList] {
        let url = try makeURL(movieInfoUrlString, key, targetDt)
        let request = makeRequest(url: url)
        let (data, _) = try await sendRequest(request: request)
        let boxofficeList = try decode(data)

        return getTopTenRank(boxofficeList)
    }
    
    private func makeURL(_ urlString: String,
                         _ key: String,
                         _ targetDt: String) throws -> URL {
        
        guard let url = URL(string: "\(urlString)?key=\(key)&targetDt=\(targetDt)") else {
            throw NetworkError.notFoundError
        }
        return url
    }
    
    private func makeRequest(url: URL) -> URLRequest {
        return URLRequest(url: url)
    }
    
    private func sendRequest(request: URLRequest) async throws -> (Data, URLResponse) {
        return try await URLSession.shared.data(for: request)
    }
    
    private func decode(_ data: Data) throws -> [DailyBoxOfficeList] {
        do {
            let decoded = try JSONDecoder().decode(MovieData.self, from: data)
            let boxofficeList = decoded.boxOfficeResult.dailyBoxOfficeList
            return boxofficeList
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
    
    private func getTopTenRank(_ boxofficeList: [DailyBoxOfficeList]) -> [DailyBoxOfficeList] {
        return boxofficeList.filter { Int($0.rank)! <= totalRank }
    }
}

#Preview(traits: .defaultLayout, body: {
    BoxofficeViewController()
})
