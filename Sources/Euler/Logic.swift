// MARK: Negation

prefix operator ¬
prefix func ¬ (value: Bool) -> Bool {
    return !value
}

prefix operator ~
prefix func ~ (value: Bool) -> Bool {
    return !value
}

// MARK: Logical Conjunction

infix operator ∧ : LogicalConjunctionPrecedence
func ∧ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs && rhs()
}

// MARK: Logical Disjunction

infix operator ∨ : LogicalDisjunctionPrecedence
func ∨ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs || rhs()
}

// MARK: Logical XOR

infix operator ⊻ : LogicalDisjunctionPrecedence
func ⊻ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ⊕ : LogicalDisjunctionPrecedence
func ⊕ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ↮ : LogicalDisjunctionPrecedence
func ↮ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

infix operator ≢ : LogicalDisjunctionPrecedence
func ≢ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return lhs != rhs()
}

// MARK: Logical NAND

infix operator ⊼ : LogicalConjunctionPrecedence
func ⊼ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

infix operator ↑ : LogicalConjunctionPrecedence
func ↑ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∧ rhs())
}

// MARK: Logical NOR

infix operator ⊽ : LogicalDisjunctionPrecedence
func ⊽ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

infix operator ↓ : LogicalDisjunctionPrecedence
func ↓ (lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
    return ¬(lhs ∨ rhs())
}

// MARK: Logical Assertion

prefix operator ⊦
prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition(), "Assertion Failed")
}
