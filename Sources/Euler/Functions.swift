// MARK: Composition

infix operator ∘ : MultiplicationPrecedence
public func ∘ <T>(lhs: @escaping (T) -> (T), rhs: @escaping (T) -> (T)) -> (T) -> (T) {
    return { (x) in
        lhs(rhs(x))
    }
}
