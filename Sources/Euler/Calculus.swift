import Foundation

// MARK: 1st Derivative

postfix operator ′
public postfix func ′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    let h = 1e-3
    return {
        return round((function($0 + h) - function($0 - h)) / (2 * h) / h) * h
    }
}

// MARK: 2nd Derivative

postfix operator ′′
public postfix func ′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return (function′)′
}

// MARK: 3rd Derivative

postfix operator ′′′
public postfix func ′′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return ((function′)′)′
}

// MARK: Nth Derivative

infix operator ′ : MultiplicationPrecedence
public func ′(lhs: inout (Double) -> Double, rhs: UInt) -> (Double) -> (Double) {
    return (0..<rhs).reduce(lhs) { (function, _) in
        return function′
    }
}

// MARK: Definite Integral

infix operator ∫ : MultiplicationPrecedence
public func ∫(lhs: (a: Double, b: Double), rhs: (Double) -> (Double)) -> Double {
    let n = Int(1e2 + 1)
    let h = (lhs.b - lhs.a) / Double(n)
    
    return (h / 3.0) * (1..<n).reduce(rhs(lhs.a)) {
        let coefficient = $1 % 2 == 0 ? 4.0 : 2.0
        return $0 + coefficient * rhs(lhs.a + Double($1) * h)
        } + rhs(lhs.b)
}

// MARK: Indefinite Integral / Antiderivative

prefix operator ∫
public prefix func ∫(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return { x in
        return (0, x)∫function
    }
}
