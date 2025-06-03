import SwiftUI

struct PageControl: View {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<numberOfPages, id: \.self) { pagingIndex in
                
                let isCurrentPage = currentPage == pagingIndex
                let height = 4.0
                let width = height
                
                Circle()
                    .fill(isCurrentPage ? .cGray2 : .white)
                    .frame(width: width, height: height)
            }
        }
        .animation(.linear, value: currentPage)
    }
}
