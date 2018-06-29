// MARK: Equality

infix operator ⩵ : ComparisonPrecedence
func ⩵<T: Equatable> (left: T, right: T) -> Bool {
    return left == right
}

// MARK: Inequality

infix operator ≠ : ComparisonPrecedence
func ≠<T: Equatable> (left: T, right: T) -> Bool {
    return left != right
}

// MARK: Less Than Or Equal To

infix operator ≤ : ComparisonPrecedence
func ≤<T: Comparable> (left: T, right: T) -> Bool {
    return left <= right
}

// MARK: Less Than And Not Equal To

infix operator ≨ : ComparisonPrecedence
func ≨<T: Comparable> (left: T, right: T) -> Bool {
    return left < right && left != right
}

// MARK: Greater Than Or Equal To

infix operator ≥ : ComparisonPrecedence
func ≥<T: Comparable> (left: T, right: T) -> Bool {
    return left >= right
}

// MARK: Greater Than And Not Equal To

infix operator ≩ : ComparisonPrecedence
func ≩<T: Comparable> (left: T, right: T) -> Bool {
    return left > right && left != right
}

// MARK: Between

infix operator ≬ : ComparisonPrecedence
func ≬<T: Comparable> (left: T, right: (T, T)) -> Bool {
    return left > right.0 && left < right.1
}

// MARK: Approximate Equality

infix operator ≈ : ComparisonPrecedence
func ≈(left: Double, right: Double) -> Bool {
    let 𝜺 = 1e-3
    return abs(nextafter(left, right) - right) < 𝜺
}

// MARK: Approximate Inequality

infix operator ≉ : ComparisonPrecedence
func ≉(left: Double, right: Double) -> Bool {
    return !(left ≈ right)
}
