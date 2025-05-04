import XCTest
@testable import Heoseungjun

final class HeoseungjunTests: XCTestCase {
    
    // 1. 데이터 생성 및 조회 테스트
    func testCreateOtherPiecesData() {
        // given
        let dataManager = OtherPiecesManager()
        
        // when
        dataManager.makeOtherPiecesData()
        
        // then
        XCTAssertNotNil(dataManager.getOhterPiecesData())
    }
    
    // 2. 셀 식별자 생성 테스트
    func testCreateCellIdentifier() {
        // given
        let stringIdentifier = "BaseballTeamsCell"
        
        // when
        let identifier = BaseballTeamsCell.identifier
        
        // then
        XCTAssertEqual(stringIdentifier, identifier)
    }
}
