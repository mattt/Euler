// MARK: Composition

infix operator ∘ : MultiplicationPrecedence
func ∘<T>(left: @escaping (T) -> (T), right: @escaping (T) -> (T)) -> (T) -> (T) {
    return { (x) in
        left(right(x))
    }
}
