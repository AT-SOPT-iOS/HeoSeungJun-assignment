import SwiftUI

struct NewTopPiecesView: View {
    private let pieces = NewTopPieces.dummy()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("오늘의 티빙 TOP20")
                .font(.customBold(ofSize: 15))
                .foregroundStyle(.white)
                .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 15) {
                    ForEach(0..<pieces.count, id: \.self) { index in
                        let piece = pieces[index]
                        
                        HStack(alignment: .bottom) {
                            Text(piece.rank)
                                .font(.system(size: 50, weight: .bold).italic())
                                .foregroundStyle(.white)
                            
                            Image(piece.image)
                                .resizable()
                                .frame(width: 98, height: 146)
                        }
                    }
                }
            }
            .frame(height: 160)
            .padding(.leading, 10)
        }
    }
}
