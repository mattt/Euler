import Foundation

// MARK: Multiplication

infix operator × : MultiplicationPrecedence
public func × <T>(lhs: T, rhs: T) -> T where T : Numeric {
    return lhs * rhs
}

// MARK: Division

infix operator ÷ : MultiplicationPrecedence
public func ÷ <T>(lhs: T, rhs: T) -> T where T : FloatingPoint {
    return lhs / rhs
}

public func ÷ <T>(lhs: T, rhs: T) -> T where T : SignedInteger & UnsignedInteger {
    return lhs / rhs
}

infix operator ∕ : MultiplicationPrecedence
public func ∕ <T>(lhs: T, rhs: T) -> T where T : FloatingPoint {
    return lhs / rhs
}

public func ∕ <T>(lhs: T, rhs: T) -> T where T : SignedInteger & UnsignedInteger {
    return lhs / rhs
}

// MARK: Square Root

prefix operator √
public prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

public prefix func √ (number: Float) -> Float {
    return sqrt(number)
}

// MARK: Cube Root

prefix operator ∛
public prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

public prefix func ∛ (number: Float) -> Float {
    return cbrt(number)
}

// MARK: Tesseract Root

prefix operator ∜
public prefix func ∜ (number: Double) -> Double {
    return pow(number, 1.0 / 4.0)
}

public prefix func ∜ (number: Float) -> Float {
    return pow(number, 1.0 / 4.0)
}


// MARK: Plus / Minus

infix operator ± : AdditionPrecedence
public func ± <T>(lhs: T, rhs: T) -> (T, T) where T : Numeric {
    return (lhs + rhs, lhs - rhs)
}

prefix operator ±
public prefix func ± <T>(value: T) -> (T, T) where T : Numeric {
    return 0 ± value
}

// MARK: Minus / Plus

infix operator ∓ : AdditionPrecedence
public func ∓ <T>(lhs: T, rhs: T) -> (T, T) where T : Numeric {
    return (lhs - rhs, lhs + rhs)
}

prefix operator ∓
public prefix func ∓ <T>(value: T) -> (T, T) where T : Numeric {
    return 0 ∓ value
}

// MARK: Divides

infix operator ∣ : MultiplicationPrecedence
public func ∣ <T>(lhs: T, rhs: T) -> Bool where T : SignedInteger & UnsignedInteger {
    return lhs % rhs == 0
}

// MARK: Does Not Divide

infix operator ∤ : MultiplicationPrecedence
public func ∤ <T>(lhs: T, rhs: T) -> Bool where T : SignedInteger & UnsignedInteger {
    return ¬(lhs ∣ rhs)
}
