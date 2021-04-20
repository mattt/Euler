import Foundation

// MARK: Dot Product

/// The dot product operator.
infix operator ⋅

/// Returns the dot product of two vectors.
///
/// - Parameters:
///   - lhs: A vector of numbers.
///   - rhs: Another vector of numbers.
public func ⋅ <T>(lhs: [T], rhs: [T]) -> T where T : Numeric & ExpressibleByIntegerLiteral {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return ∑zip(lhs, rhs).map(×)
}

// MARK: Cross Product

/// Returns the cross product of two three-element vectors.
///
/// - Parameters:
///   - lhs: A vector of three numbers.
///   - rhs: Another vector of three numbers.
public func × <T>(lhs: (T, T, T), rhs: (T, T, T)) -> (T, T, T) where T : Numeric {
    let a = lhs.1 * rhs.2 - lhs.2 * rhs.1
    let b = lhs.2 * rhs.0 - lhs.0 * rhs.2
    let c = lhs.0 * rhs.1 - lhs.1 * rhs.0
    
    return (a, b, c)
}

// Mark: Norm

/// The norm operator.
prefix operator ‖

/// Returns the norm of a vector.
///
/// - Parameters:
///   - vector: A vector of numbers.
public prefix func ‖ <S: Sequence>(vector: S) -> Double where S.Element == Double {
    return √(∑vector.map({$0 * $0}))
}

/// Returns the norm of a vector.
///
/// - Parameters:
///   - vector: A vector of numbers.
public prefix func ‖ <S: Sequence>(vector: S) -> Float where S.Element == Float {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

/// The angle operator.
infix operator ⦡

/// Returns the angle between two vectors.
///
/// - Parameters:
///   - lhs: A vector of numbers.
///   - rhs: Another vector of numbers.
/// - Important: Arguments must have the same count.
public func ⦡ (lhs: [Double], rhs: [Double]) -> Double {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}

/// Returns the angle between two vectors.
///
/// - Parameters:
///   - lhs: A vector of numbers.
///   - rhs: Another vector of numbers.
/// - Important: Arguments must have the same count.
public func ⦡ (lhs: [Float], rhs: [Float]) -> Float {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}
