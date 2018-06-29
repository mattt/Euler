import Foundation

// MARK: 1st Derivative

postfix operator ′
postfix func ′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    let h = 1e-3
    return { (x) in
        return round((function(x + h) - function(x - h)) / (2 * h) / h) * h
    }
}

// MARK: 2nd Derivative

postfix operator ′′
postfix func ′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return (function′)′
}

// MARK: 3rd Derivative

postfix operator ′′′
postfix func ′′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return ((function′)′)′
}

// MARK: Nth Derivative

infix operator ′ : MultiplicationPrecedence
func ′(left: inout (Double) -> Double, right: UInt) -> (Double) -> (Double) {
    return (0..<right).reduce(left) { (function, _) in
        return function′
    }
}

// MARK: Definite Integral

infix operator ∫ : MultiplicationPrecedence
func ∫(left: (a: Double, b: Double), right: (Double) -> (Double)) -> Double {
    let n = Int(1e2 + 1)
    let h = (left.b - left.a) / Double(n)
    
    return (h / 3.0) * (1..<n).reduce(right(left.a)) {
        let coefficient = $1 % 2 == 0 ? 4.0 : 2.0
        return $0 + coefficient * right(left.a + Double($1) * h)
        } + right(left.b)
}

// MARK: Indefinite Integral / Antiderivative

prefix operator ∫
prefix func ∫(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return { x in
        return (0, x)∫function
    }
}
