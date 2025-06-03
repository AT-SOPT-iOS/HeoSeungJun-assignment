import SwiftUI

struct NewMasterPiecesView: View {
    private let pieces = NewMasterPieces.dummy()
    @State private var selection: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("김가현PD의 인생작 TOP 5")
                    .font(.customBold(ofSize: 15))
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                
                Spacer()
                
                PageControl(numberOfPages: pieces.count, currentPage: $selection)
                    .padding(.trailing, 10)
            }
            
            GeometryReader { scrollViewGeo in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(pieces.indices, id: \.self) { index in
                            GeometryReader { itemGeo in
                                let itemCenter = itemGeo.frame(in: .global).midX
                                let scrollCenter = scrollViewGeo.frame(in: .global).midX
                                let distance = abs(scrollCenter - itemCenter)
                                
                                Color.clear
                                    .onChange(of: distance) {
                                        if distance < 85 {
                                            selection = index
                                        }
                                    }
                            }
                            .frame(width: 160, height: 90)
                            .background(
                                Image(pieces[index].image)
                                    .resizable()
                                    .cornerRadius(3)
                            )
                        }
                    }
                    .padding(.leading, 10)
                }
            }
            .frame(height: 90)
        }
    }
}
