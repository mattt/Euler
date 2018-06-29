// MARK: Set Membership

infix operator ∈ : ComparisonPrecedence
func ∈<T: Equatable> (left: T, right: [T]) -> Bool {
    return right.contains(left)
}

func ∈<T> (left: T, right: Set<T>) -> Bool {
    return right.contains(left)
}

// MARK: Set Non-Membership

infix operator ∉ : ComparisonPrecedence
func ∉<T: Equatable> (left: T, right: [T]) -> Bool {
    return ¬(left ∈ right)
}

func ∉<T> (left: T, right: Set<T>) -> Bool {
    return ¬(left ∈ right)
}

// MARK: Converse Set Membership

infix operator ∋ : ComparisonPrecedence
func ∋<T: Equatable> (left: [T], right: T) -> Bool {
    return right ∈ left
}

func ∋<T> (left: Set<T>, right: T) -> Bool {
    return right ∈ left
}

// MARK: Converse Set Non-Membership

infix operator ∌ : ComparisonPrecedence
func ∌<T: Equatable> (left: [T], right: T) -> Bool {
    return right ∉ left
}

func ∌<T> (left: Set<T>, right: T) -> Bool {
    return right ∉ left
}

// MARK: Set Intersection

infix operator ∩ : ComparisonPrecedence
func ∩<T: Equatable> (left: [T], right: [T]) -> [T] {
    var intersection: [T] = []
    for value in left {
        if value ∈ right {
            intersection.append(value)
        }
    }
    
    return intersection
}

func ∩<T> (left: Set<T>, right: Set<T>) -> Set<T> {
    return left.intersection(right)
}

// MARK: Set Union

infix operator ∪ : ComparisonPrecedence
func ∪<T: Equatable> (left: [T], right: [T]) -> [T] {
    var union: [T] = []
    for value in left + right {
        if ¬(value ∈ union) {
            union.append(value)
        }
    }
    
    return union
}

func ∪<T> (left: Set<T>, right: Set<T>) -> Set<T> {
    return left.union(right)
}

// MARK: Subset

infix operator ⊆ : ComparisonPrecedence
func ⊆<T: Equatable> (left: [T], right: [T]) -> Bool {
    return left == right || (left ⊂ right)
}

func ⊆<T> (left: Set<T>, right: Set<T>) -> Bool {
    return left.isSubset(of: right)
}

// MARK: Proper Subset

infix operator ⊂ : ComparisonPrecedence
func ⊂<T: Equatable> (left: [T], right: [T]) -> Bool {
    for value in left {
        if ¬(value ∈ right) {
            return false
        }
    }
    
    return true
}

func ⊂<T> (left: Set<T>, right: Set<T>) -> Bool {
    return left.isStrictSubset(of: right)
}

// MARK: Not A Subset Of

infix operator ⊄ : ComparisonPrecedence
func ⊄<T: Equatable> (left: [T], right: [T]) -> Bool {
    return ¬(left ⊂ right)
}

func ⊄<T> (left: Set<T>, right: Set<T>) -> Bool {
    return ¬(left ⊂ right)
}

// MARK: Superset

infix operator ⊇ : ComparisonPrecedence
func ⊇<T: Equatable> (left: [T], right: [T]) -> Bool {
    return right ⊆ left
}

func ⊇<T> (left: Set<T>, right: Set<T>) -> Bool {
    return right ⊆ left
}

// MARK: Proper Superset

infix operator ⊃ : ComparisonPrecedence
func ⊃<T: Equatable> (left: [T], right: [T]) -> Bool {
    return right ⊂ left
}

func ⊃<T> (left: Set<T>, right: Set<T>) -> Bool {
    return right ⊂ left
}

// MARK: Not A Superset Of

infix operator ⊅ : ComparisonPrecedence
func ⊅<T: Equatable> (left: [T], right: [T]) -> Bool {
    return ¬(left ⊃ right)
}

func ⊅<T> (left: Set<T>, right: Set<T>) -> Bool {
    return ¬(left ⊃ right)
}
