import Foundation

// MARK: Equality

infix operator ⩵ : ComparisonPrecedence
public func ⩵<T: Equatable> (lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

// MARK: Inequality

infix operator ≠ : ComparisonPrecedence
public func ≠<T: Equatable> (lhs: T, rhs: T) -> Bool {
    return lhs != rhs
}

// MARK: Less Than Or Equal To

infix operator ≤ : ComparisonPrecedence
public func ≤<T: Comparable> (lhs: T, rhs: T) -> Bool {
    return lhs <= rhs
}

// MARK: Less Than And Not Equal To

infix operator ≨ : ComparisonPrecedence
public func ≨<T: Comparable> (lhs: T, rhs: T) -> Bool {
    return lhs < rhs && lhs != rhs
}

// MARK: Greater Than Or Equal To

infix operator ≥ : ComparisonPrecedence
public func ≥<T: Comparable> (lhs: T, rhs: T) -> Bool {
    return lhs >= rhs
}

// MARK: Greater Than And Not Equal To

infix operator ≩ : ComparisonPrecedence
public func ≩<T: Comparable> (lhs: T, rhs: T) -> Bool {
    return lhs > rhs && lhs != rhs
}

// MARK: Between

infix operator ≬ : ComparisonPrecedence
public func ≬<T: Comparable> (lhs: T, rhs: (T, T)) -> Bool {
    return lhs > rhs.0 && lhs < rhs.1
}

// MARK: Approximate Equality

infix operator ≈ : ComparisonPrecedence
public func ≈(lhs: Double, rhs: Double) -> Bool {
    return lhs == rhs || lhs.nextDown == rhs || lhs.nextUp == rhs
}

// MARK: Approximate Inequality

infix operator ≉ : ComparisonPrecedence
public func ≉(lhs: Double, rhs: Double) -> Bool {
    return !(lhs ≈ rhs)
}
