import Foundation

// MARK: Dot Product

infix operator ⋅
func ⋅ (lhs: [Double], rhs: [Double]) -> Double {
    precondition(lhs.count == rhs.count, "arguments must have same count")
    
    var product: [Double] = []
    for (index, _) in lhs.enumerated() {
        let (a, b) = (lhs[index], rhs[index])
        product.append(a * b)
    }
    
    return ∑product
}

// MARK: Cross Product

func × (lhs: (Double, Double, Double), rhs: (Double, Double, Double)) -> (Double, Double, Double) {
    let a = lhs.1 * rhs.2 - lhs.2 * rhs.1
    let b = lhs.2 * rhs.0 - lhs.0 * rhs.2
    let c = lhs.0 * rhs.1 - lhs.1 * rhs.0
    
    return (a, b, c)
}

// Mark: Norm

prefix operator ‖
prefix func ‖ (vector: [Double]) -> Double {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

infix operator ⦡
func ⦡ (lhs: [Double], rhs: [Double]) -> Double {
    return acos((lhs ⋅ rhs) / (‖lhs * ‖rhs))
}
