// MARK: Negation

/// The logical negation operator.
prefix operator ¬

/// Returns the logical negation of a Boolean value.
///
/// - Parameters:
///   - value: A Boolean value.
public prefix func ¬ (value: Bool) -> Bool {
    return !value
}

/// The logical negation operator.
prefix operator ~

/// Returns the logical negation of a Boolean value.
///
/// - Parameters:
///   - value: A Boolean value.
public prefix func ~ (value: Bool) -> Bool {
    return !value
}

// MARK: Logical Conjunction

/// The logical conjunction operator.
infix operator ∧ : LogicalConjunctionPrecedence

/// Returns the logical conjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ∧ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs && rhs()
}

// MARK: Logical Disjunction

/// The logical disjunction operator.
infix operator ∨ : LogicalDisjunctionPrecedence

/// Returns the logical disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ∨ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs || rhs()
}

// MARK: Logical XOR

/// The logical exclusive disjunction operator.
infix operator ⊻ : LogicalDisjunctionPrecedence

/// Returns the logical exclusive disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ⊻ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

/// The logical exclusive disjunction operator.
infix operator ⊕ : LogicalDisjunctionPrecedence

/// Returns the logical exclusive disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ⊕ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

/// The logical exclusive disjunction operator.
infix operator ↮ : LogicalDisjunctionPrecedence

/// Returns the logical exclusive disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ↮ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

/// The logical exclusive disjunction operator.
infix operator ≢ : LogicalDisjunctionPrecedence

/// Returns the logical exclusive disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ≢ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

// MARK: Logical NAND

/// The logical negative conjunction operator.
infix operator ⊼ : LogicalConjunctionPrecedence

/// Returns the logical negative conjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ⊼ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

/// The logical negative conjunction operator.
infix operator ↑ : LogicalConjunctionPrecedence

/// Returns the logical negative conjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ↑ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

// MARK: Logical NOR

/// The logical negative disjunction operator.
infix operator ⊽ : LogicalDisjunctionPrecedence

/// Returns the logical negative disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ⊽ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

/// The logical negative disjunction operator.
infix operator ↓ : LogicalDisjunctionPrecedence

/// Returns the logical negative disjunction of two Boolean values.
///
/// - Parameters:
///   - lhs: A Boolean value.
///   - rhs: Another Boolean value.
public func ↓ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

// MARK: Logical Assertion

/// The logical assertion operator.
prefix operator ⊦

/// Performs an assertion with a given condition.
///
/// - Parameters:
///   - condition: A closure that returns a Boolean value.
public prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition(), "Assertion Failed")
}
