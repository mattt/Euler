import Foundation

// MARK: Dot Product

infix operator ⋅
func ⋅ (left: [Double], right: [Double]) -> Double {
    precondition(left.count == right.count, "arguments must have same count")
    
    var product: [Double] = []
    for (index, _) in left.enumerated() {
        let (a, b) = (left[index], right[index])
        product.append(a * b)
    }
    
    return ∑product
}

// MARK: Cross Product

func × (left: (Double, Double, Double), right: (Double, Double, Double)) -> (Double, Double, Double) {
    let a = left.1 * right.2 - left.2 * right.1
    let b = left.2 * right.0 - left.0 * right.2
    let c = left.0 * right.1 - left.1 * right.0
    
    return (a, b, c)
}

// Mark: Norm

prefix operator ‖
prefix func ‖ (vector: [Double]) -> Double {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

infix operator ⦡
func ⦡ (left: [Double], right: [Double]) -> Double {
    return acos((left ⋅ right) / (‖left * ‖right))
}
