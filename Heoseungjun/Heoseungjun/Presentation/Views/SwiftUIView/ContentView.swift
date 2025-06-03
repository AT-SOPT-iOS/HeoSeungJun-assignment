import SwiftUI

struct ContentView: View {
    @State var selectedMenuIndex: Int = 0
    
    var body: some View {
        VStack {
            NewHeaderView()
            NewMenuView(selectedIndex: $selectedMenuIndex)
            
            switch selectedMenuIndex {
            case 0:
                HomeView()
            case 1:
                DramaView()
            case 2:
                EntertainmentView()
            case 3:
                MovieView()
            case 4:
                SportView()
            case 5:
                NewsView()
            default:
                Text("Other")
            }
            
        }
        .background(.black)
    }
}
