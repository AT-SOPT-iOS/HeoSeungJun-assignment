import UIKit

class MainPiecesManager {
    var mainPiecesData: [MainPieces] = []
    
    func makeMainPiecesData() {
        mainPiecesData = [
            MainPieces(image: UIImage(named: "너의이름은")),
            MainPieces(image: UIImage(named: "콩심은데콩나고밥먹으면밥심난다")),
            MainPieces(image: UIImage(named: "냉장고를부탁해")),
            MainPieces(image: UIImage(named: "하트시그널4")),
            MainPieces(image: UIImage(named: "최강야구")),
            MainPieces(image: UIImage(named: "너에게닿기를2")),
            MainPieces(image: UIImage(named: "슬기로운전공의생활1"))
        ]
    }
    
    func getMainPiecesData() -> [MainPieces] {
        return mainPiecesData
    }
}

