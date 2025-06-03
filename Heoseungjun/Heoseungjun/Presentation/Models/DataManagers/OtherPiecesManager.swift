import UIKit

class OtherPiecesManager {
    var otherPiecesData: [OtherPieces] = []
    
    func makeOtherPiecesData() {
        otherPiecesData = [
            OtherPieces(image: UIImage(named: "kbo")),
            OtherPieces(image: UIImage(named: "kbl")),
            OtherPieces(image: UIImage(named: "appleTV")),
            OtherPieces(image: UIImage(named: "afc"))
        ]
    }
    
    func getOhterPiecesData() -> [OtherPieces] {
        return otherPiecesData
    }
}
