import SwiftUI

struct NewFooterView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .frame(height: 50)
                
                HStack {
                    Text("공지")
                        .font(.customLight(ofSize: 11))
                        .foregroundStyle(.white)
                    
                    Text("티빙 계정 공유 정책 추가 안내")
                        .font(.customLight(ofSize: 11))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Image("next")
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                .padding(.horizontal, 12)
                .frame(height: 50)
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            Text("고객문의·이용약관·\n사업자정보·인재채용")
                .font(.customLight(ofSize: 11))
                .foregroundStyle(.gray)
                .padding(.leading, 10)
        }
    }
}
