import Foundation

// MARK: Dot Product

infix operator ⋅
public func ⋅ <T>(lhs: [T], rhs: [T]) -> T where T : Numeric & ExpressibleByIntegerLiteral {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    
    var product: [T] = []
    for (index, _) in lhs.enumerated() {
        let (a, b) = (lhs[index], rhs[index])
        product.append(a * b)
    }
    
    return ∑product
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
public prefix func ‖ (vector: [Double]) -> Double {
    return √(∑vector.map({$0 * $0}))
}

public prefix func ‖ (vector: [Float]) -> Float {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

infix operator ⦡
public func ⦡ (lhs: [Double], rhs: [Double]) -> Double {
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}

public func ⦡ (lhs: [Float], rhs: [Float]) -> Float {
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}
