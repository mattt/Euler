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
func ∧ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left && right()
}

// MARK: Logical Disjunction

infix operator ∨ : LogicalDisjunctionPrecedence
func ∨ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left || right()
}

// MARK: Logical XOR

infix operator ⊻ : LogicalDisjunctionPrecedence
func ⊻ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ⊕ : LogicalDisjunctionPrecedence
func ⊕ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ↮ : LogicalDisjunctionPrecedence
func ↮ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ≢ : LogicalDisjunctionPrecedence
func ≢ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left != right()
}

// MARK: Logical NAND

infix operator ⊼ : LogicalConjunctionPrecedence
func ⊼ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

infix operator ↑ : LogicalConjunctionPrecedence
func ↑ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

// MARK: Logical NOR

infix operator ⊽ : LogicalDisjunctionPrecedence
func ⊽ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

infix operator ↓ : LogicalDisjunctionPrecedence
func ↓ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

// MARK: Logical Assertion

prefix operator ⊦
prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition(), "Assertion Failed")
}
