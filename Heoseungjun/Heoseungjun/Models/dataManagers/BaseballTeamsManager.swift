import UIKit

class BaseballTeamsManager {
    var baseballTeamsData: [BaseballTeams] = []
    
    func makeBaseballTeamsData() {
        baseballTeamsData = [
            BaseballTeams(image: UIImage(named: "베어스")),
            BaseballTeams(image: UIImage(named: "타이거즈")),
            BaseballTeams(image: UIImage(named: "라이온즈")),
            BaseballTeams(image: UIImage(named: "랜더스")),
            BaseballTeams(image: UIImage(named: "트윈스")),
            BaseballTeams(image: UIImage(named: "자이언츠")),
            BaseballTeams(image: UIImage(named: "이글스")),
            BaseballTeams(image: UIImage(named: "히어로즈")),
            BaseballTeams(image: UIImage(named: "위즈")),
            BaseballTeams(image: UIImage(named: "다이노스"))
        ]
    }
    
    func getBaseballTeamsData() -> [BaseballTeams] {
        return baseballTeamsData
    }
}

