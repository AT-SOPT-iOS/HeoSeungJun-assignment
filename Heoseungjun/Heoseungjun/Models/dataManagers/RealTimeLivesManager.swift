import UIKit

class RealTimeLivesManager {
    var realTimeLivesData: [RealTimeLives] = []
    
    func makeRealTimeLivesData() {
        realTimeLivesData = [
            RealTimeLives(image: UIImage(named: "환승연애3"), company: "tvN", name: "환승연애 3", viewerRating: 45.8),
            RealTimeLives(image: UIImage(named: "별들에게물어봐"), company: "tvN", name: "별들에게 물어봐", viewerRating: 30.6),
            RealTimeLives(image: UIImage(named: "선재업고튀어"), company: "tvN", name: "선재 업고 튀어", viewerRating: 24.6),
            RealTimeLives(image: UIImage(named: "지구오락실2"), company: "tvN", name: "지구오락실 2", viewerRating: 15.2),
            RealTimeLives(image: UIImage(named: "슬기로운전공의생활2"), company: "tvN", name: "슬기로운 전공의 생활 2", viewerRating: 12.3),
            RealTimeLives(image: UIImage(named: "이혼보험"), company: "tvN", name: "이혼보험", viewerRating: 8.7)
        ]
    }
    
    func getRealTimeLivesData() -> [RealTimeLives] {
        return realTimeLivesData
    }
}
