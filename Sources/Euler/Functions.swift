// MARK: Composition

infix operator ∘ : MultiplicationPrecedence
func ∘<T>(lhs: @escaping (T) -> (T), rhs: @escaping (T) -> (T)) -> (T) -> (T) {
    return { (x) in
        lhs(rhs(x))
    }
}
