import UIKit

class MasterpiecesManager {
    var masterpiecesData: [Masterpieces] = []
    
    func makeMasterpiecesData() {
        masterpiecesData = [
            Masterpieces(image: UIImage(named: "지구오락실2")),
            Masterpieces(image: UIImage(named: "슬기로운전공의생활2")),
            Masterpieces(image: UIImage(named: "별들에게물어봐")),
            Masterpieces(image: UIImage(named: "이혼보험")),
            Masterpieces(image: UIImage(named: "선재업고튀어"))
        ]
    }
    
    func getMasterpicesData() -> [Masterpieces] {
        return masterpiecesData
    }
}
