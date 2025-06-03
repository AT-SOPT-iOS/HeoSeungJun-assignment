import SwiftUI

struct NewRealTimeLivesView: View {
    let pieces: [NewRealTimeLives] = NewRealTimeLives.dummy()
    
    var body: some View {
        VStack {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.customBold(ofSize: 15))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.customSemiBold(ofSize: 12))
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 5) {
                    ForEach(0..<pieces.count, id: \.self) { index in
                        let piece = pieces[index]
                        
                        LiveItemView(piece: piece, index: index)
                    }
                }
            }
        }
    }
}
