import Foundation

// MARK: Derivative

/// The derivative operator.
postfix operator ′

/// Returns the derivative of a function.
///
/// - Parameters:
///   - function: A function that takes a number and returns a number.
public postfix func ′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return { x in
        let h: Double = x.isZero ? 1e-3 : √(ε * x)
        return round((function(x + h) - function(x - h)) / (2 * h) / h) * h
    }
}

// MARK: Integral

/// The integral operator.

/// Returns the integral of a function over an interval.
///
/// - Parameters:
///   - lhs: A tuple containing the lower and upper bounds.
///   - rhs: A function that takes a number and returns a number.
infix operator ∫ : MultiplicationPrecedence
public func ∫(lhs: (lowerBound: Double, upperBound: Double), rhs: (Double) -> (Double)) -> Double {
    let n = Int(1e2 + 1)
    let h = (lhs.upperBound - lhs.lowerBound) / Double(n)
    
    return (h / 3.0) * (1..<n).reduce(rhs(lhs.lowerBound)) {
        let coefficient = $1.isMultiple(of: 2) ? 4.0 : 2.0
        return $0 + coefficient * rhs(lhs.lowerBound + Double($1) * h)
    } + rhs(lhs.upperBound)
}

/// Returns the integral of a function over an interval.
///
/// - Parameters:
///   - lhs: A closed range.
///   - rhs: A function that takes a number and returns a number.
public func ∫(lhs: ClosedRange<Double>, rhs: (Double) -> (Double)) -> Double {
    return (lhs.lowerBound, lhs.upperBound) ∫ rhs
}
