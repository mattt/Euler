import Foundation

// MARK: Multiplication

/// The product operator.
infix operator × : MultiplicationPrecedence

/// Returns the product of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func × <T>(lhs: T, rhs: T) -> T where T : Numeric {
    return lhs * rhs
}

// MARK: Division

/// The quotient operator.
infix operator ÷ : MultiplicationPrecedence

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ÷ <T>(lhs: T, rhs: T) -> T where T : FloatingPoint {
    return lhs / rhs
}

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ÷ <T>(lhs: T, rhs: T) -> T where T : SignedInteger {
    return lhs / rhs
}

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ÷ <T>(lhs: T, rhs: T) -> T where T : UnsignedInteger {
    return lhs / rhs
}

/// The quotient operator.
infix operator ∕ : MultiplicationPrecedence

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ∕ <T>(lhs: T, rhs: T) -> T where T : FloatingPoint {
    return lhs / rhs
}

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ∕ <T>(lhs: T, rhs: T) -> T where T : SignedInteger {
    return lhs / rhs
}

/// Returns the quotient of two values.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: Another value.
public func ∕ <T>(lhs: T, rhs: T) -> T where T : UnsignedInteger {
    return lhs / rhs
}

// MARK: Square Root

/// The square root operator.
prefix operator √

/// Returns the square root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

/// Returns the square root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func √ (number: Float) -> Float {
    return sqrt(number)
}

// MARK: Cube Root

/// The cube root operator.
prefix operator ∛

/// Returns the cube root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

/// Returns the cube root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func ∛ (number: Float) -> Float {
    return cbrt(number)
}

// MARK: Tesseract Root

/// The tesseract root operator.
prefix operator ∜

/// Returns the tesseract root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func ∜ (number: Double) -> Double {
    return pow(number, 1.0 / 4.0)
}

/// Returns the tesseract root of a number.
///
/// - Parameters:
///   - number: A number.
public prefix func ∜ (number: Float) -> Float {
    return pow(number, 1.0 / 4.0)
}


// MARK: Plus / Minus

/// The plus or minus operator.
infix operator ± : AdditionPrecedence

/// Returns a tuple containing a number plus or minus another number.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: The number to add or subtract from the first number.
public func ± <T>(lhs: T, rhs: T) -> (T, T) where T : Numeric {
    return (lhs + rhs, lhs - rhs)
}

/// The plus or minus operator.
prefix operator ±

/// Returns a tuple containing the result of adding and subtracting a number from zero.
///
/// - Parameters:
///   - number: A number.
public prefix func ± <T>(number: T) -> (T, T) where T : Numeric {
    return 0 ± number
}

// MARK: Minus / Plus

/// The minus or plus operator.
infix operator ∓ : AdditionPrecedence

/// Returns a tuple containing a number minus or plus another number.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: The number to subtract or add from the first number.
public func ∓ <T>(lhs: T, rhs: T) -> (T, T) where T : Numeric {
    return (lhs - rhs, lhs + rhs)
}

/// The minus or plus operator.
prefix operator ∓

/// Returns a tuple containing the result of subtracting and adding a number to zero.
///
/// - Parameters:
///   - number: A number.
public prefix func ∓ <T>(value: T) -> (T, T) where T : Numeric {
    return 0 ∓ value
}

// MARK: Divides

/// The divides operator.
infix operator ∣ : MultiplicationPrecedence

/// Returns whether a number divides another number without a remainder.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: A number to be divided by the first number.
public func ∣ <T>(lhs: T, rhs: T) -> Bool where T : SignedInteger {
    return lhs == rhs || lhs % rhs == 0
}

/// Returns whether a number divides another number without a remainder.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: A number to be divided by the first number.
public func ∣ <T>(lhs: T, rhs: T) -> Bool where T : UnsignedInteger {
    return lhs == rhs || lhs % rhs == 0
}

// MARK: Does Not Divide

/// The does not divide operator.
infix operator ∤ : MultiplicationPrecedence

/// Returns whether a number divides another number with a remainder.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: A number to be divided by the first number.
public func ∤ <T>(lhs: T, rhs: T) -> Bool where T : SignedInteger {
    return ¬(lhs ∣ rhs)
}

/// Returns whether a number divides another number with a remainder.
///
/// - Parameters:
///   - lhs: A number.
///   - rhs: A number to be divided by the first number.
public func ∤ <T>(lhs: T, rhs: T) -> Bool where T : UnsignedInteger {
    return ¬(lhs ∣ rhs)
}
