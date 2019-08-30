import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ConstantsTests.allTests),
        testCase(LogicTests.allTests),
        testCase(ArithmeticTests.allTests),
        testCase(SetsTests.allTests),
        testCase(SequencesTests.allTests),
        testCase(VectorsTests.allTests),
        testCase(ComparisonTests.allTests),
        testCase(Calculus.allTests),
        testCase(Functions.allTests),
    ]
}
#endif
