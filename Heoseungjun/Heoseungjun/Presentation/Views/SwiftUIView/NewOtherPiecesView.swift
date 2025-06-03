import SwiftUI

struct NewOtherPiecesView: View {
    let pieces = NewOtherPieces.dummy()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<pieces.count, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(Color.gray5)
                            .frame(width: 90, height: 45)
                        
                        Image(pieces[index].image)
                            .resizable()
                            .frame(width: 68, height: 34)
                    }
                }
            }
        }
        .padding(.leading, 10)
    }
}
