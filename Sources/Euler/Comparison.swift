import Foundation

// MARK: Equality

/// The equality operator.
infix operator ⩵ : ComparisonPrecedence


/// Returns a Boolean value indicating whether two values are equal.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ⩵ <T>(lhs: T, rhs: T) -> Bool where T : Equatable {
    return lhs == rhs
}

// MARK: Inequality

/// The inequality operator.
infix operator ≠ : ComparisonPrecedence

/// Returns a Boolean value indicating whether two values are unequal.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≠ <T>(lhs: T, rhs: T) -> Bool where T : Equatable {
    return lhs != rhs
}

// MARK: Less Than Or Equal To

/// The less than or equal to operator.
infix operator ≤ : ComparisonPrecedence

/// Returns a Boolean value indicating whether a value is less than or equal to another value.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≤ <T>(lhs: T, rhs: T) -> Bool where T : Comparable {
    return lhs <= rhs
}

// MARK: Less Than And Not Equal To

/// The less than and not equal to operator.
infix operator ≨ : ComparisonPrecedence

/// Returns a Boolean value indicating whether a value is less than and not equal to another value.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≨ <T>(lhs: T, rhs: T) -> Bool where T : Comparable {
    return lhs < rhs && lhs != rhs
}

// MARK: Greater Than Or Equal To

/// The greater than or equal to operator.
infix operator ≥ : ComparisonPrecedence

/// Returns a Boolean value indicating whether a value is greater than or equal to another value.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≥ <T>(lhs: T, rhs: T) -> Bool where T : Comparable {
    return lhs >= rhs
}

// MARK: Greater Than And Not Equal To

/// The greater than and not equal to operator.
infix operator ≩ : ComparisonPrecedence

/// Returns a Boolean value indicating whether a value is greater than and not equal to another value.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≩ <T>(lhs: T, rhs: T) -> Bool where T : Comparable {
    return lhs > rhs && lhs != rhs
}

// MARK: Between

/// The between operator.
infix operator ≬ : ComparisonPrecedence

/// Returns a Boolean value indicating whether a value is between two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A tuple of values representing lower and upper bounds, respectively.
public func ≬ <T>(lhs: T, rhs: (T, T)) -> Bool where T : Comparable {
    return lhs > rhs.0 && lhs < rhs.1
}

/// Returns a Boolean value indicating whether a value is between a range of values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A range of values.
public func ≬ <T>(lhs: T, rhs: Range<T>) -> Bool where T : Comparable {
    return rhs.contains(lhs)
}

/// Returns a Boolean value indicating whether a value is between a closed range of values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A closed range of values.
public func ≬ <T>(lhs: T, rhs: ClosedRange<T>) -> Bool where T : Comparable {
    return rhs.contains(lhs)
}

// MARK: Approximate Equality

/// The approximate equality operator.
infix operator ≈ : ComparisonPrecedence

/// Returns a Boolean value indicating whether two values are unequal.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ≈ <T>(lhs: T, rhs: T) -> Bool where T : FloatingPoint {
    return lhs == rhs || lhs.nextDown == rhs || lhs.nextUp == rhs
}

// MARK: Approximate Inequality

/// Returns a Boolean value indicating whether two values are unequal.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
infix operator ≉ : ComparisonPrecedence
public func ≉ <T>(lhs: T, rhs: T) -> Bool where T : FloatingPoint {
    return !(lhs ≈ rhs)
}
