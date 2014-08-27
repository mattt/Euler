// Euler.swift
//
// Copyright (c) 2014 Mattt Thompson (http://mattt.me)
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

// MARK: - Mathematical Constants -

// MARK: Pi

let π = M_PI

// MARK: Tau

let 𝝉 = M_PI * 2

// MARK: e

let 𝑒 = M_E

// MARK: - Logic -

// MARK: Negation

prefix operator ¬ {}
prefix func ¬ (value: Bool) -> Bool {
    return !value
}

prefix operator ~ {}
prefix func ~ (value: Bool) -> Bool {
    return !value
}

// MARK: Logical Conjunction

infix operator ∧ { associativity left precedence 120 }
func ∧ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left && right()
}

// MARK: Logical Disjunction

infix operator ∨ { associativity left precedence 110 }
func ∨ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left || right()
}

// MARK: Logical XOR

infix operator ⊻ { associativity left precedence 140 }
func ⊻ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left ^ right()
}

infix operator ⊕ { associativity left precedence 140 }
func ⊕ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left ^ right()
}

infix operator ↮ { associativity left precedence 140 }
func ↮ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left ^ right()
}

infix operator ≢ { associativity left precedence 140 }
func ≢ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return left ^ right()
}

// MARK: Logical NAND

infix operator ⊼ { associativity left precedence 120 }
func ⊼ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

infix operator ↑ { associativity left precedence 120 }
func ↑ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∧ right())
}

// MARK: Logical NOR

infix operator ⊽ { associativity left precedence 110 }
func ⊽ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

infix operator ↓ { associativity left precedence 110 }
func ↓ (left: Bool, right: @autoclosure () -> Bool) -> Bool {
    return ¬(left ∨ right())
}

// MARK: Logical Assertion

prefix operator ⊦ {}
prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition, "Assertion Failed")
}

// MARK: - Arithmetic -

// MARK: Multiplication

infix operator × { associativity left precedence 150 }
func × (left: Double, right: Double) -> Double {
    return left * right
}

// MARK: Division

infix operator ÷ { associativity left precedence 150 }
func ÷ (left: Double, right: Double) -> Double {
    return left / right
}

infix operator ∕ { associativity left precedence 150 }
func ∕ (left: Double, right: Double) -> Double {
    return left / right
}

// MARK: Square Root

prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

// MARK: Cube Root

prefix operator ∛ {}
prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

// MARK: Plus / Minus

infix operator ± { associativity left precedence 140 }
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ± {}
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

// MARK: Minus / Plus

infix operator ∓ { associativity left precedence 140 }
func ∓ (left: Double, right: Double) -> (Double, Double) {
    return (left - right, left + right)
}

prefix operator ∓ {}
prefix func ∓ (value: Double) -> (Double, Double) {
    return 0 ∓ value
}

// MARK: Divides

infix operator ∣ { associativity left precedence 150 }
func ∣ (left: Int, right: Int) -> Bool {
    return left % right == 0
}

// MARK: Does Not Divide

infix operator ∤ { associativity left }
func ∤ (left: Int, right: Int) -> Bool {
    return ¬(left ∣ right)
}

// MARK: Sets -

// MARK: Set Membership

infix operator ∈ { associativity left }
func ∈<T: Equatable> (left: T, right: [T]) -> Bool {
    return contains(right, left)
}

// MARK: Set Non-Membership

infix operator ∉ { associativity left }
func ∉<T: Equatable> (left: T, right: [T]) -> Bool {
    return ¬(left ∈ right)
}

// MARK: Converse Set Membership

infix operator ∋ { associativity left }
func ∋<T: Equatable> (left: [T], right: T) -> Bool {
    return right ∈ left
}

// MARK: Converse Set Non-Membership

infix operator ∌ { associativity left }
func ∌<T: Equatable> (left: [T], right: T) -> Bool {
    return right ∉ left
}

// MARK: Set Intersection

infix operator ∩ { associativity left }
func ∩<T: Equatable> (left: [T], right: [T]) -> [T] {
    var intersection: [T] = []
    for value in left {
        if value ∈ right {
            intersection.append(value)
        }
    }

    return intersection
}

// MARK: Set Union

infix operator ∪ { associativity left }
func ∪<T: Equatable> (left: [T], right: [T]) -> [T] {
    var union: [T] = []
    for value in left + right {
        if ¬(value ∈ union) {
            union.append(value)
        }
    }

    return union
}

// MARK: Subset

infix operator ⊆ { associativity left }
func ⊆<T: Equatable> (left: [T], right: [T]) -> Bool {
    return left == right || (left ⊂ right)
}

// MARK: Proper Subset

infix operator ⊂ { associativity left }
func ⊂<T: Equatable> (left: [T], right: [T]) -> Bool {
    for value in left {
        if ¬(value ∈ right) {
            return false
        }
    }

    return true
}

// MARK: Not A Subset Of

infix operator ⊄ { associativity left }
func ⊄<T: Equatable> (left: [T], right: [T]) -> Bool {
    return ¬(left ⊂ right)
}

// MARK: Superset

infix operator ⊇ { associativity left }
func ⊇<T: Equatable> (left: [T], right: [T]) -> Bool {
    return right ⊆ left
}

// MARK: Proper Superset

infix operator ⊃ { associativity left }
func ⊃<T: Equatable> (left: [T], right: [T]) -> Bool {
    return right ⊂ left
}

// MARK: Not A Superset Of

infix operator ⊅ { associativity left }
func ⊅<T: Equatable> (left: [T], right: [T]) -> Bool {
    return ¬(left ⊃ right)
}

// MARK: - Sequences -

// MARK: Summation

prefix operator ∑ {}
prefix func ∑ (values: [Double]) -> Double {
    return reduce(values, 0.0, +)
}

// MARK: Cartesian Product

prefix operator ∏ {}
prefix func ∏ (values: [Double]) -> Double {
    return reduce(values, 1.0, *)
}

// MARK: - Vectors -

// MARK: Dot Product

infix operator ⋅ {}
func ⋅ (left: [Double], right: [Double]) -> Double {
    precondition(left.count == right.count, "arguments must have same count")

    var product: [Double] = []
    for (index, _) in enumerate(left) {
        let (a, b) = (left[index], right[index])
        product.append(a * b)
    }

    return ∑product
}

// Mark: Norm

prefix operator ‖ {}
prefix func ‖ (vector: [Double]) -> Double {
    return √(∑vector.map({$0 * $0}))
}

// MARK: Angle

infix operator ⦡ {}
func ⦡ (left: [Double], right: [Double]) -> Double {
    return acos((left ⋅ right) / (‖left * ‖right))
}

// MARK: - Comparison -

// MARK: Equality

infix operator ⩵ { associativity left }
func ⩵<T: Equatable> (left: T, right: T) -> Bool {
    return left == right
}

// MARK: Inequality

infix operator ≠ { associativity left }
func ≠<T: Equatable> (left: T, right: T) -> Bool {
    return left != right
}

// MARK: Less Than Or Equal To

infix operator ≤ { associativity left }
func ≤<T: Comparable> (left: T, right: T) -> Bool {
    return left <= right
}

// MARK: Less Than And Not Equal To

infix operator ≨ { associativity left }
func ≨<T: Comparable> (left: T, right: T) -> Bool {
    return left < right && left != right
}

// MARK: Greater Than Or Equal To

infix operator ≥ { associativity left }
func ≥<T: Comparable> (left: T, right: T) -> Bool {
    return left >= right
}

// MARK: Greater Than And Not Equal To

infix operator ≩ { associativity left }
func ≩<T: Comparable> (left: T, right: T) -> Bool {
    return left > right && left != right
}

// MARK: Between

infix operator ≬ { associativity left }
func ≬<T: Comparable> (left: T, right: (T, T)) -> Bool {
    return left > right.0 && left < right.1
}
