import XCTest
@testable import Euler

final class FunctionsTests: XCTestCase {
    func testComposition() {
        let f: (Double) -> Double = sin
        let g: (Double) -> Double = cos

        for x in stride(from: 0, to: 4 * π, by: π / 8) {
            XCTAssertEqual((f ∘ g)(x), sin(cos(x)))
        }
    }
}
