import Foundation

// MARK: Dot Product

infix operator ⋅
public func ⋅ <T>(lhs: [T], rhs: [T]) -> T where T : Numeric & ExpressibleByIntegerLiteral {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return ∑zip(lhs, rhs).map(×)
}

// MARK: Cross Product

public func × <T>(lhs: (T, T, T), rhs: (T, T, T)) -> (T, T, T) where T : Numeric {
    let a = lhs.1 * rhs.2 - lhs.2 * rhs.1
    let b = lhs.2 * rhs.0 - lhs.0 * rhs.2
    let c = lhs.0 * rhs.1 - lhs.1 * rhs.0
    
    return (a, b, c)
}

// Mark: Norm

prefix operator ‖
public prefix func ‖ <S: Sequence>(vector: S) -> Double where S.Element == Double {
    return √(∑vector.map({$0 * $0}))
}

public prefix func ‖ <S: Sequence>(vector: S) -> Float where S.Element == Float {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

infix operator ⦡
public func ⦡ (lhs: [Double], rhs: [Double]) -> Double {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}

public func ⦡ (lhs: [Float], rhs: [Float]) -> Float {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}
