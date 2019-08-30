import XCTest
@testable import Euler

fileprivate let houseAnimals = Set<Character>("🐕🐈")
fileprivate let farmAnimals = Set<Character>("🐄🐓🐑🐖🐕🐈")
fileprivate let cityAnimals = Set<Character>("🐦🦝🐀")

final class SetsTests: XCTestCase {
    func testSetMembership() {
        XCTAssert("🐓" ∈ Array(farmAnimals))
        XCTAssert("🐓" ∈ farmAnimals)
    }

    func testSetNonMembership() {
        XCTAssert("🐅" ∉ Array(houseAnimals))
        XCTAssert("🐅" ∉ houseAnimals)
    }

    func testConverseSetMembership() {
        XCTAssert(Array(cityAnimals) ∋ "🦝")
        XCTAssert(cityAnimals ∋ "🦝")
    }

    func testConverseSetNonMembership() {
        XCTAssert(Array(houseAnimals) ∌ "🦂")
        XCTAssert(houseAnimals ∌ "🦂")
    }

    func testConverseSetIntersection() {
        XCTAssertEqual(Array(cityAnimals) ∩ Array(farmAnimals), [])
        XCTAssertEqual(cityAnimals ∩ farmAnimals, Set())
    }

    func testConverseSetUnion() {
        XCTAssertEqual(Set(Array(houseAnimals) ∪ Array(farmAnimals)), farmAnimals)
        XCTAssertEqual(houseAnimals ∪ farmAnimals, farmAnimals)
    }

    func testSubset() {
        XCTAssert(Array(houseAnimals) ⊆ Array(farmAnimals))
        XCTAssert(houseAnimals ⊆ farmAnimals)
    }

    func testProperSubset() {
        XCTAssert(Array(houseAnimals) ⊂ Array(farmAnimals))
        XCTAssert(houseAnimals ⊂ farmAnimals)
    }

    func testNotASubSetOf() {
        XCTAssert(Array(cityAnimals) ⊄ Array(farmAnimals))
        XCTAssert(cityAnimals ⊄ farmAnimals)
    }

    func testSuperset() {
        XCTAssert(Array(farmAnimals) ⊇ Array(houseAnimals))
        XCTAssert(farmAnimals ⊇ houseAnimals)
    }

    func testProperSuperset() {
        XCTAssert(Array(farmAnimals) ⊃ Array(houseAnimals))
        XCTAssert(farmAnimals ⊃ houseAnimals)
    }

    func testNotASupersetOf() {
        XCTAssert(Array(farmAnimals) ⊅ Array(cityAnimals))
        XCTAssert(farmAnimals ⊅ cityAnimals)
    }

    static var allTests = [
        ("testSetMembership", testSetMembership),
        ("testSetNonMembership", testSetNonMembership),
        ("testConverseSetMembership", testConverseSetMembership),
        ("testConverseSetNonMembership", testConverseSetNonMembership),
        ("testConverseSetIntersection", testConverseSetIntersection),
        ("testConverseSetUnion", testConverseSetUnion),
        ("testSubset", testSubset),
        ("testProperSubset", testProperSubset),
        ("testNotASubSetOf", testNotASubSetOf),
        ("testSuperset", testSuperset),
        ("testProperSuperset", testProperSuperset),
        ("testNotASupersetOf", testNotASupersetOf)
    ]
}
