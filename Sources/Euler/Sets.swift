// MARK: Set Membership

infix operator ∈ : ComparisonPrecedence
public func ∈<T: Equatable> (lhs: T, rhs: [T]) -> Bool {
    return rhs.contains(lhs)
}

public func ∈<T> (lhs: T, rhs: Set<T>) -> Bool {
    return rhs.contains(lhs)
}

// MARK: Set Non-Membership

infix operator ∉ : ComparisonPrecedence
public func ∉<T: Equatable> (lhs: T, rhs: [T]) -> Bool {
    return ¬(lhs ∈ rhs)
}

public func ∉<T> (lhs: T, rhs: Set<T>) -> Bool {
    return ¬(lhs ∈ rhs)
}

// MARK: Converse Set Membership

infix operator ∋ : ComparisonPrecedence
public func ∋<T: Equatable> (lhs: [T], rhs: T) -> Bool {
    return rhs ∈ lhs
}

public func ∋<T> (lhs: Set<T>, rhs: T) -> Bool {
    return rhs ∈ lhs
}

// MARK: Converse Set Non-Membership

infix operator ∌ : ComparisonPrecedence
public func ∌<T: Equatable> (lhs: [T], rhs: T) -> Bool {
    return rhs ∉ lhs
}

public func ∌<T> (lhs: Set<T>, rhs: T) -> Bool {
    return rhs ∉ lhs
}

// MARK: Set Intersection

infix operator ∩ : ComparisonPrecedence
public func ∩<T: Equatable> (lhs: [T], rhs: [T]) -> [T] {
    var intersection: [T] = []
    for value in lhs {
        if value ∈ rhs {
            intersection.append(value)
        }
    }
    
    return intersection
}

public func ∩<T> (lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.intersection(rhs)
}

// MARK: Set Union

infix operator ∪ : ComparisonPrecedence
public func ∪<T: Equatable> (lhs: [T], rhs: [T]) -> [T] {
    var union: [T] = []
    for value in lhs + rhs {
        if ¬(value ∈ union) {
            union.append(value)
        }
    }
    
    return union
}

public func ∪<T> (lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.union(rhs)
}

// MARK: Subset

infix operator ⊆ : ComparisonPrecedence
public func ⊆<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    return lhs == rhs || (lhs ⊂ rhs)
}

public func ⊆<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isSubset(of: rhs)
}

// MARK: Proper Subset

infix operator ⊂ : ComparisonPrecedence
public func ⊂<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    for value in lhs {
        if ¬(value ∈ rhs) {
            return false
        }
    }
    
    return true
}

public func ⊂<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isStrictSubset(of: rhs)
}

// MARK: Not A Subset Of

infix operator ⊄ : ComparisonPrecedence
public func ⊄<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    return ¬(lhs ⊂ rhs)
}

public func ⊄<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return ¬(lhs ⊂ rhs)
}

// MARK: Superset

infix operator ⊇ : ComparisonPrecedence
public func ⊇<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    return rhs ⊆ lhs
}

public func ⊇<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return rhs ⊆ lhs
}

// MARK: Proper Superset

infix operator ⊃ : ComparisonPrecedence
public func ⊃<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    return rhs ⊂ lhs
}

public func ⊃<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return rhs ⊂ lhs
}

// MARK: Not A Superset Of

infix operator ⊅ : ComparisonPrecedence
public func ⊅<T: Equatable> (lhs: [T], rhs: [T]) -> Bool {
    return ¬(lhs ⊃ rhs)
}

public func ⊅<T> (lhs: Set<T>, rhs: Set<T>) -> Bool {
    return ¬(lhs ⊃ rhs)
}
