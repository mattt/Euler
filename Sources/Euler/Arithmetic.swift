import Foundation

// MARK: Multiplication

infix operator × : MultiplicationPrecedence
public func × (lhs: Double, rhs: Double) -> Double {
    return lhs * rhs
}

// MARK: Division

infix operator ÷ : MultiplicationPrecedence
public func ÷ (lhs: Double, rhs: Double) -> Double {
    return lhs / rhs
}

infix operator ∕ : MultiplicationPrecedence
public func ∕ (lhs: Double, rhs: Double) -> Double {
    return lhs / rhs
}

// MARK: Square Root

prefix operator √
public prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

// MARK: Cube Root

prefix operator ∛
public prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

// MARK: Tesseract Root

prefix operator ∜
public prefix func ∜ (number: Double) -> Double {
    return pow(number, 1.0 / 4.0)
}

// MARK: Plus / Minus

infix operator ± : AdditionPrecedence
public func ± (lhs: Double, rhs: Double) -> (Double, Double) {
    return (lhs + rhs, lhs - rhs)
}

prefix operator ±
public prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

// MARK: Minus / Plus

infix operator ∓ : AdditionPrecedence
public func ∓ (lhs: Double, rhs: Double) -> (Double, Double) {
    return (lhs - rhs, lhs + rhs)
}

prefix operator ∓
public prefix func ∓ (value: Double) -> (Double, Double) {
    return 0 ∓ value
}

// MARK: Divides

infix operator ∣ : MultiplicationPrecedence
public func ∣ (lhs: Int, rhs: Int) -> Bool {
    return lhs % rhs == 0
}

// MARK: Does Not Divide

infix operator ∤ : MultiplicationPrecedence
public func ∤ (lhs: Int, rhs: Int) -> Bool {
    return ¬(lhs ∣ rhs)
}
