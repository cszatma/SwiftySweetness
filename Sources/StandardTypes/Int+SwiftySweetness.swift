//    Copyright (c) 2017 Christopher Szatmary <cs@christopherszatmary.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

import Foundation

public extension Int {
    
    // - MARK: Properties
    
    /// Returns true if the Int is palindromic.
    public var isPalindromic: Bool {
        return self == reverseNumber()
    }
    
    /// A Bool indicating whether or not an Int is negative.
    public var isNegative: Bool {
        return self < 0
    }
    
    /// The number of digits in the Int.
    public var numberOfDigits: Int {
        return (Double(self) |> log10 |> floor |> Int.init(_:)) + 1
    }
    
    /// A returns a Bool indicating whether or not the Int is a prime number.
    public var isPrime: Bool {
        if self < 0 { return (self * -1).isPrime }
        if self < 2 { return false }
        let squareRoot = Int(sqrt(Double(self)))
        if squareRoot * squareRoot == self { return false }
        for i in 2..<Int(ceil(sqrt(Double(self)))) where self % i == 0 {
            return false
        }
        return true
    }
    
    // - MARK: Methods
    
    /// Raises value of Int on left to power of Int on right.
    public static func ** (lhs: Int, rhs: Int) -> Int {
        return Int(pow(Double(lhs), Double(rhs)))
    }
    
    /// Power assignment statement.
    public static func **= (lhs: inout Int, rhs: Int) {
        lhs = lhs ** rhs
    }
    
    /// Reverses the order of the digits and returns the new number.
    /// - returns: The number reversed.
    public func reverseNumber() -> Int {
        var num = self
        var result = 0
        while num > 0 {
            result = (result * 10) + num % 10
            num /= 10
        }
        return result
    }
    
    /// Returns the digit at the specified index. Integers are zero indexed with the first digit being the least significant digit and the last digit being the most significant digit.
    /// - parameter index: The index of the digit.
    /// - returns: The digit at the specified index.
    public func digit(at index: Int) -> Int? {
        var num = self
        
        guard index >= 0 && index < num.numberOfDigits else {
            return nil
        }
        
        num /= 10 ** index
        let digit = num % 10
        return digit
    }
    
}
