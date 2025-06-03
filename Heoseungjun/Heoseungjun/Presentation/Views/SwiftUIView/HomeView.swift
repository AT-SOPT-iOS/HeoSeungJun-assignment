import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                NewMainPiecesView()
                NewTopPiecesView()
                NewRealTimeLivesView()
                NewRealTimeMoviesView()
                NewBaseballTeamsView()
                NewOtherPiecesView()
                NewMasterPiecesView()
                NewFooterView()
            }
        }
    }
}
