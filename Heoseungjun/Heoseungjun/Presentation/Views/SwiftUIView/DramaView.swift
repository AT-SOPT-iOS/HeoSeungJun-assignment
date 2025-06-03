import SwiftUI

struct DramaView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Drama View")
                    .foregroundStyle(.white)
            }
            .background(.black)
            .frame(height: 650)
        }
    }
}
