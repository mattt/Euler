import XCTest
@testable import Euler

final class SequencesTests: XCTestCase {
    func testSummation() {
        XCTAssertEqual(∑([] as [Int]), 0)
        XCTAssertEqual(∑([1, 2, 3, 4, 5] as [Int]), 15)
    }

    func testCartesianProduct() {
        XCTAssertEqual(∏([] as [Int]), 1)
        XCTAssertEqual(∏([1, 2, 3, 4, 5] as [Int]), 120)
    }

    static var allTests = [
        ("testSummation", testSummation),
        ("testCartesianProduct", testCartesianProduct)
    ]
}
