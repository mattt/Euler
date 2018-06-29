import XCTest
@testable import Euler

final class LogicTests: XCTestCase {
    func testLogicalNegation() {
        XCTAssertEqual(¬true, !true)
        XCTAssertEqual(~true, !true)
    }
    
    func testLogicalConjunction() {
        XCTAssertEqual(true ∧ false, true && false)
    }
    
    func testLogicalDisjunction() {
        XCTAssertEqual(true ∨ false, true || false)
    }
    
//    func testLogicalXOR() {
//        XCTAssertEqual(true ⊻ false, true ^ false)
//        XCTAssertEqual(true ⊕ false, true ^ false)
//        XCTAssertEqual(true ↮ false, true ^ false)
//        XCTAssertEqual(true ≢ false, true ^ false)
//    }
    
//    func testLogicalNAND() {
//        XCTAssertEqual(true ⊼ false, !(true ^ false))
//        XCTAssertEqual(true ↑ false, !(true ^ false))
//    }
    
    func testLogicalNOR() {
        XCTAssertEqual(true ⊽ false, !(true || false))
        XCTAssertEqual(true ↓ false, !(true || false))
    }
    
    static var allTests = [
        ("testLogicalNegation", testLogicalNegation),
        ("testLogicalConjunction", testLogicalConjunction),
        ("testLogicalDisjunction", testLogicalDisjunction),
//        ("testLogicalXOR", testLogicalXOR),
//        ("testLogicalNAND", testLogicalNAND),
        ("testLogicalNOR", testLogicalNOR)
    ]
}
