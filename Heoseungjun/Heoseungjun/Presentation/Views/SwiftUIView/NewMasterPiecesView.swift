import SwiftUI

struct NewMasterPiecesView: View {
    private let pieces = NewMasterPieces.dummy()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("김가현PD의 인생작 TOP 5")
                .font(.customBold(ofSize: 15))
                .foregroundStyle(.white)
                .padding(.leading, 10)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<pieces.count, id: \.self) { index in
                        Image(pieces[index].image)
                            .resizable()
                            .frame(width: 160, height: 90)
                            .cornerRadius(3)
                    }
                }
            }
            .padding(.leading, 10)
        }
    }
}
