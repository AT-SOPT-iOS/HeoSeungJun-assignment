import SwiftUI

struct NewMenuView: View {
    let menus = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(menus.indices, id: \.self) { index in
                makeMenu(menus[index], isSelected: index == selectedIndex)
                    .onTapGesture {
                        selectedIndex = index
                    }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
        .background(.black)
    }
    
    private func makeMenu(_ title: String, isSelected: Bool) -> some View {
        return Text(title)
            .foregroundStyle(.white)
            .font(.customBlack(ofSize: 17))
    }
}
