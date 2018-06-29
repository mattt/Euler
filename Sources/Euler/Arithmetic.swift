import Foundation

// MARK: Multiplication

infix operator × : MultiplicationPrecedence
func × (left: Double, right: Double) -> Double {
    return left * right
}

// MARK: Division

infix operator ÷ : MultiplicationPrecedence
func ÷ (left: Double, right: Double) -> Double {
    return left / right
}

infix operator ∕ : MultiplicationPrecedence
func ∕ (left: Double, right: Double) -> Double {
    return left / right
}

// MARK: Square Root

prefix operator √
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

// MARK: Cube Root

prefix operator ∛
prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

// MARK: Tesseract Root

prefix operator ∜
prefix func ∜ (number: Double) -> Double {
    return pow(number, 1.0 / 4.0)
}

// MARK: Plus / Minus

infix operator ± : AdditionPrecedence
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ±
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

// MARK: Minus / Plus

infix operator ∓ : AdditionPrecedence
func ∓ (left: Double, right: Double) -> (Double, Double) {
    return (left - right, left + right)
}

prefix operator ∓
prefix func ∓ (value: Double) -> (Double, Double) {
    return 0 ∓ value
}

// MARK: Divides

infix operator ∣ : MultiplicationPrecedence
func ∣ (left: Int, right: Int) -> Bool {
    return left % right == 0
}

// MARK: Does Not Divide

infix operator ∤ : MultiplicationPrecedence
func ∤ (left: Int, right: Int) -> Bool {
    return ¬(left ∣ right)
}
