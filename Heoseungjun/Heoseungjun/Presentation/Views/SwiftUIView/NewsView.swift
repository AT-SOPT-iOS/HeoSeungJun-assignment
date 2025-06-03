import SwiftUI

struct NewsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("News View")
                    .foregroundStyle(.white)
            }
            .background(.black)
            .frame(height: 680)
        }
    }
}
