// MARK: Summation

prefix operator ∑
public prefix func ∑ (values: [Double]) -> Double {
    return values.reduce(0.0, +)
}

// MARK: Cartesian Product

prefix operator ∏
public prefix func ∏ (values: [Double]) -> Double {
    return values.reduce(1.0, *)
}
