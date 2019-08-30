import XCTest
@testable import Euler

final class ArithmeticTests: XCTestCase {
    func testMultiplication() {
        XCTAssertEqual(2 × 3, 2 * 3)
    }

    func testDivision() {
        XCTAssertEqual((21 as Int) ÷ (7 as Int), 21 / 7)
        XCTAssertEqual((21 as UInt) ÷ (7 as UInt), 21 / 7)
        XCTAssertEqual(21.0 ÷ 7.0, 21.0 / 7.0)

        XCTAssertEqual((21 as Int) ÷ (7 as Int), 21 / 7)
        XCTAssertEqual((21 as UInt) ∕ (7 as UInt), 21 / 7)
        XCTAssertEqual(21.0 ∕ 7.0, 21.0 / 7.0)
    }

    func testSquareRoot() {
        XCTAssertEqual(√(4 as Double), sqrt(4))
        XCTAssertEqual(√(4 as Float), sqrt(4))
    }

    func testCubeRoot() {
        XCTAssertEqual(∛(8 as Double), cbrt(8))
        XCTAssertEqual(∛(8 as Float), cbrt(8))
    }

    func testTesseractRoot() {
        XCTAssertEqual(∜(16 as Double), sqrt(sqrt(16)))
        XCTAssertEqual(∜(16 as Double), sqrt(sqrt(16)))
    }

    func testPlusMinus() {
        do {
            let result = 1 ± 2
            XCTAssertEqual(result.0, 3)
            XCTAssertEqual(result.1, -1)
        }

        do {
            let result = ±1
            XCTAssertEqual(result.0, 1)
            XCTAssertEqual(result.1, -1)
        }
    }

    func testMinusPlus() {
        do {
            let result = 1 ∓ 2
            XCTAssertEqual(result.0, -1)
            XCTAssertEqual(result.1, 3)
        }

        do {
            let result = ∓1
            XCTAssertEqual(result.0, -1)
            XCTAssertEqual(result.1, 1)
        }
    }

    func testDivides() {
        XCTAssertEqual((8 as Int) ∣ (2 as Int), 8 % 2 == 0)
        XCTAssertEqual((8 as UInt) ∣ (2 as UInt), 8 % 2 == 0)
    }

    func testDoesNotDivide() {
        XCTAssertEqual((7 as Int) ∣ (5 as Int), 7 % 5 == 0)
        XCTAssertEqual((7 as UInt) ∣ (5 as UInt), 7 % 5 == 0)
    }

    static var allTests = [
        ("testMultiplication", testMultiplication),
        ("testDivision", testDivision),
        ("testSquareRoot", testSquareRoot),
        ("testCubeRoot", testCubeRoot),
        ("testTesseractRoot", testTesseractRoot),
        ("testPlusMinus", testPlusMinus),
        ("testMinusPlus", testMinusPlus),
        ("testDivides", testDivides),
        ("testDoesNotDivide", testDoesNotDivide)
    ]
}
