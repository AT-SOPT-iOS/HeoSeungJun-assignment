import SwiftUI

struct ContentView: View {
    
    private let headerView = NewHeaderView()
    private let menuView = NewMenuView()
    private let mainPiecesView = NewMainPiecesView()
    private let topPiecesView = NewTopPiecesView()
    private let realTimeLivesView = NewRealTimeLivesView()
    private let realTimeMoviesView = NewRealTimeMoviesView()
    private let baseballTeamsView = NewBaseballTeamsView()
    private let otherPiecesView = NewOtherPiecesView()
    private let masterPiecesView = NewMasterPiecesView()
    private let footerView = NewFooterView()
    
    var body: some View {
        VStack {
            headerView
            menuView
            
            ScrollView {
                VStack(spacing: 20) {
                    mainPiecesView
                    topPiecesView
                    realTimeLivesView
                    realTimeMoviesView
                    baseballTeamsView
                    otherPiecesView
                    masterPiecesView
                    footerView
                }
            }
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
