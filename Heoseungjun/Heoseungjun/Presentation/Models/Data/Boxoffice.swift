import UIKit

struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList 
struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let audiAcc: String
    let rankOldAndNew: String
}
