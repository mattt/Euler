// MARK: Summation

prefix operator ∑
prefix func ∑ (values: [Double]) -> Double {
    return values.reduce(0.0, +)
}

// MARK: Cartesian Product

prefix operator ∏
prefix func ∏ (values: [Double]) -> Double {
    return values.reduce(1.0, *)
}
