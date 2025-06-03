import SwiftUI

struct NewBaseballTeamsView: View {
    let teams = NewBaseballTeams.dummy()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<teams.count, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(makeBackground(index))
                            .frame(width: 80, height: 50)
                        
                        Image(teams[index].image)
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
            }
        }
    }
    
    private func makeBackground(_ index: Int) -> Color {
        return index % 2 == 0 ? .white : .black
    }
}
