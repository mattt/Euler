import Foundation

// MARK: Derivative

postfix operator ′
public postfix func ′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return { x in
        let h: Double = x.isZero ? 1e-3 : √(ε * x)
        return round((function(x + h) - function(x - h)) / (2 * h) / h) * h
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
