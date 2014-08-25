# Euler

Euler uses [custom operators in the "Math Symbols"](https://developer.apple.com/library/prerelease/ios/documentation/swift/conceptual/swift_programming_language/LexicalStructure.html#//apple_ref/doc/uid/TP40014097-CH30-XID_934) character set to implement functions using traditional mathematical notation.

**Please keep in mind that this is not intended or recommended for production.** Custom operators of any breed are ripe for misuse and abuse, and should be used with as much care and caution as you would something like method swizzling or complex macros.

Euler is much better-suited to a Playground, where it could be used for teaching and learning logic and mathematics using a more vernacular notation.

> Euler is named after [Leonhard Euler](http://en.wikipedia.org/wiki/Leonhard_Euler), the Swiss mathematician credited for the popularization of modern mathematical notation, such as the Greek letters `Σ` for summation & `π` for the ratio of a circle's circumference to its diameter, the letters _`e`_ to denote the base of the natural logarithm & _`i`_ to denote the imaginary unit, `sin`, `cos`, et al. for trigonometric functions, and `f(x)` to denote the function `f` with argument `x`.

## Installation

_The infrastructure and best practices for distributing Swift libraries is currently being developed by the developer community during this beta period of the language and Xcode. In the meantime, you can simply add Euler as a git submodule, and drag the `Euler.swift` file into your Xcode project._

---

## Inventory

### Logic

- `¬`, `~` - [Logical Negation](http://en.wikipedia.org/wiki/Negation)
- `∧` - [Logical Conjunction](http://en.wikipedia.org/wiki/Logical_conjunction)
- `∨` - [Logical Disjunction](http://en.wikipedia.org/wiki/Logical_disjunction)
- `⊻`, `⊕`, `↮`, `≢` - [Logical XOR](http://en.wikipedia.org/wiki/Exclusive_or)
- `⊼`, `↑` - [Logical NAND](http://en.wikipedia.org/wiki/Logical_NAND)
- `⊽`, `↓` - [Logical NOR](http://en.wikipedia.org/wiki/Logical_NOR)
- `⊦` - [Logical Assertion](http://en.wikipedia.org/wiki/Logical_Assertion)

## Arithmetic

- `×` - [Multiplication](http://en.wikipedia.org/wiki/Multiplication)
- `÷`, `∕` - [Division](http://en.wikipedia.org/wiki/Division_%28mathematics%29)
- `√` - [Square Root](http://en.wikipedia.org/wiki/Square_root)
- `∛` - [Cube Root](http://en.wikipedia.org/wiki/Cube_root)
- `±` - [Plus/Minus](http://en.wikipedia.org/wiki/Plus-minus_sign)
- `∓` - [Minus/Plus](http://en.wikipedia.org/wiki/Plus-minus_sign#Minus-plus_sign)
- `∣` - [Divides](http://en.wikipedia.org/wiki/Divisor)
- `∤` - [Does Not Divide](http://en.wikipedia.org/wiki/Divisor)

## Sets

- `∈` - [Set Membership](http://en.wikipedia.org/wiki/Element_%28mathematics%29)
- `∉` - [Set Non-Membership](http://en.wikipedia.org/wiki/Element_%28mathematics%29)
- `∋` - [Converse Set Membership](http://en.wikipedia.org/wiki/Element_%28mathematics%29)
- `∌` - [Converse Set Membership](http://en.wikipedia.org/wiki/Element_%28mathematics%29)
- `∩` - [Set Intersection](http://en.wikipedia.org/wiki/Intersection_%28set_theory%29)
- `∪` - [Set Union](http://en.wikipedia.org/wiki/Union_%28set_theory%29)
- `⊆` - [Subset](http://en.wikipedia.org/wiki/Subset)
- `⊂` - [Proper Subset](http://en.wikipedia.org/wiki/Subset)
- `⊄` - [Not A Subset Of](http://en.wikipedia.org/wiki/Subset)
- `⊇` - [Superset](http://en.wikipedia.org/wiki/Subset)
- `⊃` - [Proper Superset](http://en.wikipedia.org/wiki/Subset)
- `⊅` - [Not A Superset Of](http://en.wikipedia.org/wiki/Subset)

## Sequences

- `∑` - [Summation](http://en.wikipedia.org/wiki/Summation)
- `∏` - [Cartesian Product](http://en.wikipedia.org/wiki/Cartesian_product)

## Vectors

- `⋅` - [Dot Product](http://en.wikipedia.org/wiki/Dot_product)
- `‖` - [Vector Norm](http://en.wikipedia.org/wiki/Norm_%28mathematics%29)
- `⦡` - [Angle Between Vectors](http://en.wikipedia.org/wiki/Dot_product)

## Comparison

- `⩵` - [Equality](http://en.wikipedia.org/wiki/Equality_%28mathematics%29)
- `≠` - [Inequality](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)
- `≤` - [Less Than Or Equal To](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)
- `≨` - [Less Than And Not Equal To](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)
- `≥` - [Greater Than Or Equal To](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)
- `≩` - [Greater Than And Not Equal To](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)
- `≬` - [Between](http://en.wikipedia.org/wiki/Inequality_%28mathematics%29)

---

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

Euler is available under the MIT license. See the LICENSE file for more info.
