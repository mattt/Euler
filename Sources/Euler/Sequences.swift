// MARK: Summation

prefix operator ∑
public prefix func ∑ <T>(values: [T]) -> T where T : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(0, +)
}

// MARK: Cartesian Product

prefix operator ∏
public prefix func ∏ <T>(values: [T]) -> T where T : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(1, *)
}
