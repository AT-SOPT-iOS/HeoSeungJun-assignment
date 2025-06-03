import SwiftUI

struct LiveItemView: View {
    let piece: NewRealTimeLives
    let index: Int

    var body: some View {
        VStack(alignment: .leading) {
            Image(piece.image)
                .resizable()
                .frame(width: 160, height: 80)
                .padding(.leading, 10)
            
            HStack(alignment: .top, spacing: 8) {
                Text("\(index + 1)")
                    .font(.system(size: 19, weight: .bold).italic())
                    .foregroundStyle(.white)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(piece.company)
                        .font(.customLight(ofSize: 10))
                        .foregroundStyle(.white)

                    Text(piece.name)
                        .font(.customLight(ofSize: 10))
                        .foregroundStyle(Color.gray2)

                    Text(piece.viewerRating)
                        .font(.customLight(ofSize: 10))
                        .foregroundStyle(Color.gray2)
                }
            }
            .padding(.leading, 10)
        }
    }
}
