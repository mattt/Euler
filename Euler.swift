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
// See: https://devforums.apple.com/message/1000934#1000934

// MARK: - Logic

prefix operator ¬ {}
prefix func ¬ (value: Bool) -> Bool {
    return !value
}

infix operator ∧ { associativity left precedence 120 }
func ∧ (left: Bool, right: Bool) -> Bool {
    return left && right
}

infix operator ∨ { associativity left precedence 110 }
func ∨ (left: Bool, right: Bool) -> Bool {
    return left || right
}

infix operator ⊻ { associativity left precedence 140 }
func ⊻ (left: Bool, right: Bool) -> Bool {
    return left ^ right
}

infix operator ⊼ { associativity left precedence 120 }
func ⊼ (left: Bool, right: Bool) -> Bool {
    return ¬(left ∧ right)
}

infix operator ⊽ { associativity left precedence 110 }
func ⊽ (left: Bool, right: Bool) -> Bool {
    return ¬(left ∨ right)
}

prefix operator ⊦ {}
prefix func ⊦ (condition: @autoclosure () -> Bool) {
    assert(condition, "Assertion Failed")
}

// MARK: - Arithmetic

infix operator × { associativity left precedence 150 }
func × (left: Double, right: Double) -> Double {
    return left * right
}

infix operator ÷ { associativity left precedence 150 }
func ÷ (left: Double, right: Double) -> Double {
    return left / right
}

infix operator ∕ { associativity left precedence 150 }
func ∕ (left: Double, right: Double) -> Double {
    return left / right
}

prefix operator √ {}
prefix func √ (number: Double) -> Double {
    return sqrt(number)
}

prefix operator ∛ {}
prefix func ∛ (number: Double) -> Double {
    return cbrt(number)
}

infix operator ± { associativity left precedence 140 }
func ± (left: Double, right: Double) -> (Double, Double) {
    return (left + right, left - right)
}

prefix operator ± {}
prefix func ± (value: Double) -> (Double, Double) {
    return 0 ± value
}

infix operator ∓ { associativity left precedence 140 }
func ∓ (left: Double, right: Double) -> (Double, Double) {
    return (left - right, left + right)
}

prefix operator ∓ {}
prefix func ∓ (value: Double) -> (Double, Double) {
    return 0 ∓ value
}

infix operator ∣ { associativity left precedence 150 }
func ∣ (left: Int, right: Int) -> Bool {
    return left % right == 0
}

infix operator ∤ { associativity left }
func ∤ (left: Int, right: Int) -> Bool {
    return ¬(left ∣ right)
}

// MARK: - Sets

infix operator ∈ { associativity left }
func ∈<T: Equatable> (left: T, right: Array<T>) -> Bool {
    return contains(right, left)
}

infix operator ∉ { associativity left }
func ∉<T: Equatable> (left: T, right: Array<T>) -> Bool {
    return ¬(left ∈ right)
}

infix operator ∋ { associativity left }
func ∈<T: Equatable> (left: Array<T>, right: T) -> Bool {
    return right ∈ left
}

infix operator ∌ { associativity left }
func ∌<T: Equatable> (left: Array<T>, right: T) -> Bool {
    return right ∉ left
}

infix operator ∩ { associativity left }
func ∩<T: Equatable> (left: Array<T>, right: Array<T>) -> Array<T> {
    var intersection: Array<T> = []
    for value in left {
        if value ∈ right {
            intersection.append(value)
        }
    }

    return intersection
}

infix operator ∪ { associativity left }
func ∪<T: Equatable> (left: Array<T>, right: Array<T>) -> Array<T> {
    var union: Array<T> = left
    for value in right {
        if ¬(value ∈ left) {
            union.append(value)
        }
    }

    return union
}

infix operator ⊂ { associativity left }
func ⊂<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    for value in left {
        if ¬(value ∈ right) {
            return false
        }
    }

    return true
}

infix operator ⊆ { associativity left }
func ⊆<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return left == right || (left ⊂ right)
}

infix operator ⊊ { associativity left }
func ⊊<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return left ⊂ right
}

infix operator ⊄ { associativity left }
func ⊄<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return ¬(left ⊂ right)
}

infix operator ⊃ { associativity left }
func ⊃<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return right ⊂ left
}

infix operator ⊇ { associativity left }
func ⊇<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return right ⊆ left
}

infix operator ⊋ { associativity left }
func ⊋<T: Equatable> (left: Array<T>, right: Array<T>) -> Bool {
    return left ⊃ right
}

// MARK: - Sequences

prefix operator ∑ {}
prefix func ∑ (values: Array<Double>) -> Double {
    return reduce(values, 0.0, +)
}

prefix operator ∏ {}
prefix func ∏ (values: Array<Double>) -> Double {
    return reduce(values, 1.0, *)
}

infix operator ⋅ {}
func ⋅ (left: Array<Double>, right: Array<Double>) -> Double? {
    if left.count != right.count {
        return nil
    }

    var product: Array<Double> = []
    for (index, _) in enumerate(left) {
        let (a, b) = (left[index], right[index])
        product.append(a * b)
    }

    return ∑product
}

// MARK: - Comparison

infix operator ⩵ { associativity left }
func ⩵<T: Equatable> (left: T, right: T) -> Bool {
    return left == right
}

infix operator ≤ { associativity left }
func ≤<T: Comparable> (left: T, right: T) -> Bool {
    return left <= right
}

infix operator ≥ { associativity left }
func ≥<T: Comparable> (left: T, right: T) -> Bool {
    return left >= right
}

infix operator ≬ { associativity left }
func ≬<T: Comparable> (left: T, right: (T, T)) -> Bool {
    return left > right.0 && left < right.1
}
