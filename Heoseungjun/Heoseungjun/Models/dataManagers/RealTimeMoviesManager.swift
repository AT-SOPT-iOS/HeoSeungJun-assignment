import UIKit

class RealTimeFavoriteMoviesManager {
    var topPiecesData: [TopPieces] = []
    
    func makeTopPiecesData() {
        topPiecesData = [
            TopPieces(image: UIImage(named: "시그널"), rank: 1),
            TopPieces(image: UIImage(named: "해리포터"), rank: 2),
            TopPieces(image: UIImage(named: "반지의제왕"), rank: 3),
            TopPieces(image: UIImage(named: "스즈메의문단속"), rank: 4),
            TopPieces(image: UIImage(named: "너의이름은"), rank: 5)
        ]
    }
}
