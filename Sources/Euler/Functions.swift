// MARK: Composition

// The functional composition operator.
infix operator ∘ : MultiplicationPrecedence

/// Returns the composition of two functions.
///
/// - Parameters:
///   - lhs: A function.
///   - rhs: Another function.
public func ∘ <T>(lhs: @escaping (T) -> (T), rhs: @escaping (T) -> (T)) -> (T) -> (T) {
    return { (x) in
        lhs(rhs(x))
    }
}
