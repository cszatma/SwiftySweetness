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

public extension String {
    
    // - MARK: Properties
    
    /// Returns a trimmed version of the text without leading or trailing whitespace and newlines.
    public var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // - MARK: Methods
    
    /// Returns the character at the given index of a string.
    public subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    /// Returns a substring within the given Range of a string.
    public subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[Range(start ..< end)])
    }
    
    /// Returns a substring within the given ClosedRange of a string.
    public subscript (r: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound + 1)
        return String(self[Range(start..<end)])
    }
    
    /// Returns the character present at the given index in a string.
    /// - parameter index: The index of the character.
    /// - returns: The character at the given index.
    public func char(at index: Int) -> Character {
        return self[index]
    }
    
    /**
     Adds a padding of a given length to a string.
     - parameters:
         - character: The character to add.
         - length: The length of the padding.
     - returns: The string with the applied padding.
    */
    public func pad(with character: Character, toLength length: Int) -> String {
        let padCount = length - count
        guard padCount > 0 else { return self }
        
        return String(repeating: character, count: padCount) + self
    }
    
    /// Splits a camel cased string. For example, the string "thisIsCamelCased" would return "this Is Camel Cased".
    public func splitCamelCase() -> String {
        return unicodeScalars.flatMap({ CharacterSet.uppercaseLetters.contains($0) ? " \($0)" : String($0) }).joined()
    }
    
    /// Returns the first letter of each word in the string. For example, the string "Hello World" would return "HW".
    public func initials() -> String {
        guard !self.isEmpty else { return "" }
        return components(separatedBy: " ").map({ String($0.first!) }).filter({ CharacterSet.letters.contains($0.unicodeScalars.first!) }).joined(separator: "")
    }
}
