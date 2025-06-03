import SwiftUI

struct NewRealTimeMoviesView: View {
    let pieces: [NewRealTimeMovies] = NewRealTimeMovies.dummy()
    
    var body: some View {
        VStack {
            HStack {
                Text("실시간 인기 영화")
                    .font(.customBold(ofSize: 15))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.customSemiBold(ofSize: 12))
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<pieces.count, id: \.self) { index in
                        Image(pieces[index].image)
                            .resizable()
                            .frame(width: 98, height: 146)
                            .cornerRadius(3)
                    }
                }
            }
            .padding(.leading, 10)
        }
    }
}
