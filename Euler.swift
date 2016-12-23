// Euler.swift
//
// Copyright (c) 2014–2015 Mattt Thompson (http://mattt.me)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
import Foundation

// Custom Operators Using Math Symbols
// See: https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_85
// SE-0077 Operator Precedence
// See: https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md
// MARK: - Mathematical Constants -
// MARK: Pi
let π = M_PI

// MARK: Tau
let 𝝉 = M_PI * 2

// MARK: e
let 𝑒 = M_E

// MARK: Golden ratio
let φ = sqrt(5)/2 + 0.5

// MARK: - Logic -
// MARK: Negation
prefix operator ¬
prefix func ¬ (value: Bool) -> Bool {
    return !value
}

prefix operator ~
prefix func ~ (value: Bool) -> Bool {
    return !value
}

// MARK: Logical Conjunction
infix operator ∧ : LogicalConjunctionPrecedence
func ∧ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left && right()
}

// MARK: Logical Disjunction
infix operator ∨ : LogicalDisjunctionPrecedence
func ∨ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left || right()
}

// MARK: Logical XOR
infix operator ⊻ : LogicalDisjunctionPrecedence
func ⊻ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ⊕ : LogicalDisjunctionPrecedence
func ⊕ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ↮ : LogicalDisjunctionPrecedence
func ↮ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left != right()
}

infix operator ≢ : LogicalDisjunctionPrecedence
func ≢ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return left != right()
}

// MARK: Logical NAND
infix operator ⊼ : LogicalConjunctionPrecedence
func ⊼ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

infix operator ↑ : LogicalConjunctionPrecedence
func ↑ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

// MARK: Logical NOR
infix operator ⊽ : LogicalDisjunctionPrecedence
func ⊽ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

infix operator ↓ : LogicalDisjunctionPrecedence
func ↓ (left: Bool, right:  @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

// MARK: Logical Assertion
prefix operator ⊦
prefix func ⊦ ( condition:  @autoclosure () -> Bool) {
    assert(condition(), "Assertion Failed")
}

// MARK: - Arithmetic -
// MARK: Multiplication
infix operator × : MultiplicationPrecedence
func × (left: Double, right: Double) -> Double {
    return left * right
}

// MARK: Division
infix operator ÷ : AdditionPrecedence
func ÷ (left: Double, right: Double) -> Double {
    return left / right
}

infix operator ∕ : MultiplicationPrecedence
func ∕ (left: Double, right: Double) -> Double {
    return left / right
}

// MARK: Square Root
prefix operator √
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

// MARK: Cube Root
prefix operator ∛
prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

// MARK: Tesseract Root
prefix operator ∜
prefix func ∜ (number: Double) -> Double {
    return pow(number, 1.0 / 4.0)
}

// MARK: Plus / Minus
precedencegroup PlusMinusPrecedence{
    associativity: left
    lowerThan: AdditionPrecedence
}

infix operator ± : PlusMinusPrecedence
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ±
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

// MARK: Minus / Plus
infix operator ∓ : PlusMinusPrecedence
func ∓ (left: Double, right: Double) -> (Double, Double) {
    return (left - right, left + right)
}

prefix operator ∓
prefix func ∓ (value: Double) -> (Double, Double) {
    return 0 ∓ value
}

// MARK: Divides
infix operator ∣ : ComparisonPrecedence
func ∣ (left: Int, right: Int) -> Bool {
    return left % right == 0
}

// MARK: Does Not Divide
infix operator ∤ : ComparisonPrecedence
func ∤ (left: Int, right: Int) -> Bool {
    return ¬(left ∣ right)
}

// MARK: Sets -
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
infix operator ∩ : AdditionPrecedence
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
infix operator ∪ : AdditionPrecedence
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

// MARK: - Sequences -
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

// MARK: - Vectors -
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

// MARK: - Comparison -
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


// MARK: - Calculus -
// MARK: 1st Derivative
postfix operator ′
postfix func ′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    let h = 1e-3
    return { (x) in
        return round((function(x + h) - function(x - h)) / (2 * h) / h) * h
    }
}

// MARK: 2nd Derivative
postfix operator ′′
postfix func ′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return (function′)′
}

// MARK: 3rd Derivative
postfix operator ′′′
postfix func ′′′(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return ((function′)′)′
}

// MARK: Nth Derivative
precedencegroup AssiciativityLeftPrecedence {
    associativity: left
}

infix operator ′ : AssiciativityLeftPrecedence
func ′(left: @escaping ((Double) -> Double), right: UInt) -> (Double) -> (Double) {
    return (0..<right).reduce(left, { (function, _) -> ((Double) -> Double) in
        return function′
    })
}

// MARK: Definite Integral
infix operator ∫ : AssiciativityLeftPrecedence
func ∫(left: (a: Double, b: Double), right: (Double) -> (Double)) -> Double {
    let n = Int(1e2 + 1)
    let h = (left.b - left.a) / Double(n)
    
    
    return (h / 3.0) * ((1..<n).reduce(right(left.a)) {
        let coefficient = $1 % 2 == 0 ? 4.0 : 2.0
        return $0 + coefficient * right(left.a + Double($1) * h)
        } + right(left.b))
}

// MARK: Indefinite Integral / Antiderivative
prefix operator ∫
prefix func ∫(function: @escaping (Double) -> (Double)) -> (Double) -> (Double) {
    return { x in
        return (0, x)∫function
    }
}

// MARK: - Functions -
// MARK: Composition
infix operator ∘ : AssiciativityLeftPrecedence
func ∘<T>(left: @escaping (T) -> (T), right: @escaping (T) -> (T)) -> (T) -> (T) {
    return { (x) in
        left(right(x))
    }
}
