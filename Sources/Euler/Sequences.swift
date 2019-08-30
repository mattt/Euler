// MARK: Summation

prefix operator ∑
public prefix func ∑ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(0, +)
}

// MARK: Cartesian Product

prefix operator ∏
public prefix func ∏ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(1, *)
}
