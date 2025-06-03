import SwiftUI

struct MovieView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Movie View")
                    .foregroundStyle(.white)
            }
            .background(.black)
            .frame(height: 680)
        }
    }
}
