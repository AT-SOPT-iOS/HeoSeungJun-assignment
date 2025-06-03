import SwiftUI

struct NewMenuView: View {
    let menus = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(menus, id: \.self) { menu in
                makeMenu(menu)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
        .background(.black)
    }
    
    private func makeMenu(_ title: String) -> some View {
        return Text(title)
            .foregroundStyle(.white)
            .font(.customBlack(ofSize: 17))
    }
}
