struct NewRealTimeMovies {
    var image: String

    static func dummy() -> [Self] {
        return [
            NewRealTimeMovies(image: "시그널"),
            NewRealTimeMovies(image: "해리포터"),
            NewRealTimeMovies(image: "반지의제왕"),
            NewRealTimeMovies(image: "스즈메의문단속")
        ]
    }
}
