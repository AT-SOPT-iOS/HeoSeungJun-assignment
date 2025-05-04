import UIKit

class RealTimeMoviesManager {
    var realTimeMoviesData: [RealTimeMovies] = []
    
    func makeRealTimeMoviesData() {
        realTimeMoviesData = [
            RealTimeMovies(image: UIImage(named: "시그널")),
            RealTimeMovies(image: UIImage(named: "해리포터")),
            RealTimeMovies(image: UIImage(named: "반지의제왕")),
            RealTimeMovies(image: UIImage(named: "스즈메의문단속")),
            RealTimeMovies(image: UIImage(named: "너의이름은"))
        ]
    }
    
    func getRealTimeMoviesData() -> [RealTimeMovies] {
        return realTimeMoviesData
    }
}
