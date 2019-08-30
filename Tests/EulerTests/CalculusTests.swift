import XCTest
@testable import Euler

final class CalculusTests: XCTestCase {
    func testDerivative() {
        let f: (Double) -> Double = sin
        for x in stride(from: 0, to: 2 * π, by: π / 8) {
            XCTAssertEqual((f′)(x), cos(x), accuracy: 1e-6)
        }
    }

    func testIntegral() {
        let f: (Double) -> Double = sin
        XCTAssertEqual((0, π)∫f, 2, accuracy: 1e-3)
    }
}
