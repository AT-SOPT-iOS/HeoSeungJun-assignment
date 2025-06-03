struct NewTopPieces {
    var image: String
    var rank: String
    
    static func dummy() -> [Self] {
        return [
            NewTopPieces(image: "시그널", rank: "1"),
            NewTopPieces(image: "해리포터", rank: "2"),
            NewTopPieces(image: "반지의제왕", rank: "3"),
            NewTopPieces(image: "스즈메의문단속", rank: "4")
        ]
    }
}
