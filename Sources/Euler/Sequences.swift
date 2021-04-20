// MARK: Summation

/// The summation operator.
prefix operator ∑

/// Returns the summation of a sequence of numbers.
///
/// - Parameters:
///   - values: A sequence of numbers.
public prefix func ∑ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(0, +)
}

// MARK: Cartesian Product

/// The Cartesian product operator.
prefix operator ∏

/// Returns the Cartesian product of a sequence of numbers.
///
/// - Parameters:
///   - values: A sequence of numbers.
public prefix func ∏ <S: Sequence>(values: S) -> S.Element where S.Element : Numeric & ExpressibleByIntegerLiteral {
    return values.reduce(1, *)
}
