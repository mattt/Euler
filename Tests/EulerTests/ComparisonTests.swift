import XCTest
@testable import Euler

final class ComparisonTests: XCTestCase {
    func testEquality() {
        XCTAssert(true ⩵ true)
    }

    func testInequality() {
        XCTAssert(true ≠ false)
    }

    func testLessThanOrEqualTo() {
        XCTAssert(!(1 ≤ -1))
        XCTAssert(1 ≤ 2)
        XCTAssert(2 ≤ 2)
        XCTAssert(!(3 ≤ 2))
    }

    func testLessThanAndNotEqualTo() {
        XCTAssert(!(1 ≨ -1))
        XCTAssert(1 ≨ 2)
        XCTAssert(!(2 ≨ 2))
    }

    func testGreaterThanOrEqualTo() {
        XCTAssert(!(-1 ≩ 1))
        XCTAssert(1 ≥ 0)
        XCTAssert(1 ≥ 1)
        XCTAssert(!(1 ≥ 2))
    }

    func testGreaterThanAndNotEqualTo() {
        XCTAssert(1 ≩ 0)
        XCTAssert(!(1 ≩ 1))
        XCTAssert(!(1 ≩ 2))
    }

    func testBetween() {
        XCTAssert(3 ≬ (1, 5))
        XCTAssert(!(0 ≬ (1, 5)))
        XCTAssert(!(7 ≬ (1, 5)))
    }

    func testApproximateEquality() {
        XCTAssert(!(1 ≈ -1))
        XCTAssert(1 ≈ 1)
        XCTAssert(1.nextUp ≈ 1)
        XCTAssert(1 ≈ 1.nextDown)
        XCTAssert(!(1.nextUp ≈ 1.nextDown))
    }

    func testApproximateInequality() {
        XCTAssert(1 ≉ -1)
        XCTAssert(!(1 ≉ 1))
        XCTAssert(!(1.nextUp ≉ 1))
        XCTAssert(!(1 ≉ 1.nextDown))
        XCTAssert(1.nextUp ≉ 1.nextDown)
    }
}
