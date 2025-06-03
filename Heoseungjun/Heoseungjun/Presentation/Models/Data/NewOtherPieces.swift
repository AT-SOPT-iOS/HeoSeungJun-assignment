struct NewOtherPieces {
    var image: String
    
    static func dummy() -> [Self] {
        return [
            NewOtherPieces(image: "kbo"),
            NewOtherPieces(image: "kbl"),
            NewOtherPieces(image: "appleTV"),
            NewOtherPieces(image: "afc")
        ]
    }
}
