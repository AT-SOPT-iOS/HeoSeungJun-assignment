struct NewBaseballTeams {
    var image: String
    
    static func dummy() -> [Self] {
        return [
            NewBaseballTeams(image: "베어스"),
            NewBaseballTeams(image: "다이노스"),
            NewBaseballTeams(image: "라이온즈"),
            NewBaseballTeams(image: "랜더스"),
            NewBaseballTeams(image: "위즈"),
            NewBaseballTeams(image: "이글스"),
            NewBaseballTeams(image: "자이언츠"),
            NewBaseballTeams(image: "타이거즈"),
            NewBaseballTeams(image: "트윈스"),
            NewBaseballTeams(image: "히어로즈")
        ]
    }
}
