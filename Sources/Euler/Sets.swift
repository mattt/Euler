// MARK: Set Membership

/// The set membership operator.
infix operator ∈ : ComparisonPrecedence

/// Returns whether an element is a member of a set.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A set of values.
public func ∈ <T>(lhs: T, rhs: [T]) -> Bool where T : Equatable {
    return rhs.contains(lhs)
}

/// Returns whether an element is a member of a set.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A set of values.
public func ∈ <T>(lhs: T, rhs: Set<T>) -> Bool {
    return rhs.contains(lhs)
}

// MARK: Set Non-Membership

/// The set non-membership operator.
infix operator ∉ : ComparisonPrecedence

/// Returns whether an element is not a member of a set.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A set of values.
public func ∉ <T>(lhs: T, rhs: [T]) -> Bool where T : Equatable {
    return ¬(lhs ∈ rhs)
}

/// Returns whether an element is not a member of a set.
///
/// - Parameters:
///   - lhs: A value.
///   - rhs: A set of values.
public func ∉ <T>(lhs: T, rhs: Set<T>) -> Bool {
    return ¬(lhs ∈ rhs)
}

// MARK: Converse Set Membership

/// The converse set membership operator.
infix operator ∋ : ComparisonPrecedence

/// Returns whether a set contains a value.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: A value.
public func ∋ <T>(lhs: [T], rhs: T) -> Bool where T : Equatable {
    return rhs ∈ lhs
}

/// Returns whether a set contains a value.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: A value.
public func ∋ <T>(lhs: Set<T>, rhs: T) -> Bool {
    return rhs ∈ lhs
}

// MARK: Converse Set Non-Membership

/// The converse set non-membership operator.
infix operator ∌ : ComparisonPrecedence

/// Returns whether a set does not contains a value.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: A value.
public func ∌ <T>(lhs: [T], rhs: T) -> Bool where T : Equatable {
    return rhs ∉ lhs
}

/// Returns whether a set does not contains a value.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: A value.
public func ∌ <T>(lhs: Set<T>, rhs: T) -> Bool {
    return rhs ∉ lhs
}

// MARK: Set Intersection

/// The set intersection operator.
infix operator ∩ : ComparisonPrecedence

/// Returns the intersection of two sets.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ∩ <T>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.intersection(rhs)
}

/// Returns the intersection of two sets.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ∩ <T>(lhs: [T], rhs: [T]) -> [T] where T : Equatable {
    var intersection: [T] = []
    for value in lhs {
        if value ∈ rhs {
            intersection.append(value)
        }
    }
    
    return intersection
}

// MARK: Set Union

/// The set union operator.
infix operator ∪ : ComparisonPrecedence

/// Returns the union of two sets.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ∪ <T>(lhs: Set<T>, rhs: Set<T>) -> Set<T> {
    return lhs.union(rhs)
}

/// Returns the union of two sets.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ∪ <T>(lhs: [T], rhs: [T]) -> [T] where T : Equatable {
    var union: [T] = []
    for value in lhs + rhs {
        if ¬(value ∈ union) {
            union.append(value)
        }
    }
    
    return union
}

// MARK: Subset

/// The subset operator.
infix operator ⊆ : ComparisonPrecedence

/// Returns whether a set is a subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊆ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isSubset(of: rhs)
}

/// Returns whether a set is a subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊆ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    return lhs == rhs || (lhs ⊂ rhs)
}

// MARK: Proper Subset

/// The proper subset operator.
infix operator ⊂ : ComparisonPrecedence

/// Returns whether a set is a proper subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊂ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.isStrictSubset(of: rhs)
}

/// Returns whether a set is a proper subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊂ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    for value in lhs {
        if ¬(value ∈ rhs) {
            return false
        }
    }
    
    return true
}

// MARK: Not A Subset Of

/// The not a subset of operator.
infix operator ⊄ : ComparisonPrecedence

/// Returns whether a set is not a subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊄ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return ¬(lhs ⊂ rhs)
}

/// Returns whether a set is not a subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊄ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    return ¬(lhs ⊂ rhs)
}

// MARK: Superset

/// The superset operator.
infix operator ⊇ : ComparisonPrecedence

/// Returns whether a set is not a proper subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊇ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return rhs ⊆ lhs
}

/// Returns whether a set is not a proper subset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊇ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    return rhs ⊆ lhs
}

// MARK: Proper Superset

/// The proper superset operator.
infix operator ⊃ : ComparisonPrecedence

/// Returns whether a set is a proper superset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊃ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return rhs ⊂ lhs
}

/// Returns whether a set is a proper superset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊃ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    return rhs ⊂ lhs
}

// MARK: Not A Superset Of

/// The not a superset of operator.
infix operator ⊅ : ComparisonPrecedence

/// Returns whether a set is not a superset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊅ <T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return ¬(lhs ⊃ rhs)
}

/// Returns whether a set is not a superset of another set.
///
/// - Parameters:
///   - lhs: A set of values.
///   - rhs: Another set of values.
public func ⊅ <T>(lhs: [T], rhs: [T]) -> Bool where T : Equatable {
    return ¬(lhs ⊃ rhs)
}
