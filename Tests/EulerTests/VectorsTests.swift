import XCTest
@testable import Euler

final class VectorsTests: XCTestCase {
    func testDotProduct() {
        XCTAssertEqual((([] as [Double]) ⋅ ([] as [Double])), 0)
        XCTAssertEqual((([1, 3, 5] as [Double]) ⋅ ([2, 4, 6] as [Double])), 44)
    }

    func testCrossProduct() {
        let result = (1, 3, 5) × (2, 4, 6)
        XCTAssertEqual(result.0, -2)
        XCTAssertEqual(result.1, 4)
        XCTAssertEqual(result.2, -2)
    }

    func testNorm() {
        XCTAssertEqual(‖([] as [Double]), 0)
        XCTAssertEqual(‖([1, 2, 3] as [Double]), sqrt(14.0))
    }

    func testAngle() {
        XCTAssert((([] as [Double]) ⦡ ([] as [Double])).isNaN)
        XCTAssertEqual((([1] as [Double]) ⦡ ([1] as [Double])), 0)
        XCTAssertEqual((([0, 1] as [Double]) ⦡ ([1, 0] as [Double])), π/2)
    }
}
