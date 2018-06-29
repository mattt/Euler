import XCTest
@testable import Euler

final class EulerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Euler().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
