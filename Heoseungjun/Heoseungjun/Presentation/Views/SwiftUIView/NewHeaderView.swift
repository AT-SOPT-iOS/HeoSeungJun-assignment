import SwiftUI

struct NewHeaderView: View {
    var body: some View {
        HStack {
            Image("tvingLogo")
                .resizable()
                .frame(width: 191, height: 78)
            
            Spacer()
            
            HStack(spacing: 16) {
                Image("search")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Image("profile")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
        }
        .background(.black)
    }
}
