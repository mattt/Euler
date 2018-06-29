// MARK: Negation

prefix operator ¬
public prefix func ¬ (value: Bool) -> Bool {
    return !value
}

prefix operator ~
public prefix func ~ (value: Bool) -> Bool {
    return !value
}

// MARK: Logical Conjunction

infix operator ∧ : LogicalConjunctionPrecedence
public func ∧ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs && rhs()
}

// MARK: Logical Disjunction

infix operator ∨ : LogicalDisjunctionPrecedence
public func ∨ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs || rhs()
}

// MARK: Logical XOR

infix operator ⊻ : LogicalDisjunctionPrecedence
public func ⊻ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ⊕ : LogicalDisjunctionPrecedence
public func ⊕ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ↮ : LogicalDisjunctionPrecedence
public func ↮ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ≢ : LogicalDisjunctionPrecedence
public func ≢ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

// MARK: Logical NAND

infix operator ⊼ : LogicalConjunctionPrecedence
public func ⊼ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

infix operator ↑ : LogicalConjunctionPrecedence
public func ↑ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

// MARK: Logical NOR

infix operator ⊽ : LogicalDisjunctionPrecedence
public func ⊽ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

infix operator ↓ : LogicalDisjunctionPrecedence
public func ↓ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

// MARK: Logical Assertion

prefix operator ⊦
public prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition(), "Assertion Failed")
}
