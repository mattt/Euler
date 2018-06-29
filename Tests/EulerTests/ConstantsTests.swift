import XCTest
@testable import Euler

final class ConstantsTests: XCTestCase {
    func testPi() {
        XCTAssertEqual(π, Double.pi)
    }
    
    func testTau() {
        XCTAssertEqual(𝝉, Double.pi * 2)
    }
    
    func testE() {
        XCTAssertEqual(𝑒, M_E)
    }

    static var allTests = [
        ("testPi", testPi),
        ("testTau", testTau),
        ("testE", testE)
    ]
}
