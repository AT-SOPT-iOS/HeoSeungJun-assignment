import SwiftUI

struct NewMainPiecesView: View {
    let pieces = NewMainPieces.dummy()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(0..<pieces.count, id: \.self) { index in
                    Image(pieces[index].image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 375, height: 400)
                        .clipped()
                }
            }
        }
        .background(.black)
        .frame(width: 375, height: 400)
    }
}
