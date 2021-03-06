//: Playground - noun: a place where people can play

import UIKit

// Mark - String

// 1 - Are the letters unique?
func isStringContainUniqueLetter(input: String) -> Bool {
    return Set(input.characters).count == input.characters.count
}

isStringContainUniqueLetter(input: "No duplicates")
isStringContainUniqueLetter(input: "abcdefghijklmnopqrstuvwxyz")
isStringContainUniqueLetter(input: "AaBbCc")
isStringContainUniqueLetter(input: "Hello, world")

// 2 - Is a string palindrome?
func isStringPalindrome(input: String) -> Bool {
    let lowercaseString = input.lowercased()
    return lowercaseString.characters.reversed() == Array(lowercaseString.characters)
}

isStringPalindrome(input: "rotator")
isStringPalindrome(input: "Rats live on no evil star")
isStringPalindrome(input: "Never odd or even")
isStringPalindrome(input: "Hello, world")

// 3 - Do two strings contain the same characters?
func doTwoStringContainSameCharacters(input: String, input2: String) -> Bool {
//    let characterOnly = input.replacingOccurrences(of: " ", with: ""),
//    characterOnly2 = input2.replacingOccurrences(of: " ", with: "")
//    return Set(characterOnly.characters) == Set(characterOnly2.characters) && characterOnly.characters.count == characterOnly2.characters.count
    
    let array = Array(input.characters),
    array2 = Array(input2.characters)
    return array.sorted() == array2.sorted()
}

doTwoStringContainSameCharacters(input: "abca", input2: "abca")
doTwoStringContainSameCharacters(input: "abc", input2: "cba")
doTwoStringContainSameCharacters(input: "a1 b2", input2: "b1 a2")
doTwoStringContainSameCharacters(input: "a1 b2", input2: "b 1 a 2")
doTwoStringContainSameCharacters(input: "abc", input2: "abca")
doTwoStringContainSameCharacters(input: "abc", input2: "Abc")
doTwoStringContainSameCharacters(input: "abc", input2: "cbAa")

// 4 - Does one string contain another?
extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return self.range(of: string, options: .caseInsensitive) != nil
    }
}

"Hello, world".fuzzyContains("Hello")
"Hello, world".fuzzyContains("WORLD")
"Hello, world".fuzzyContains("Goodbye")

// 5 - Count the characters
func countCharacter(_ character: Character, inString string: String) -> Int {
//    var count = 0
//    for c in string {
//        if c == character {
//            count+=1
//        }
//    }
//    return count
    
//    return string.characters.reduce(0, {
//        $1 == character ? $0 + 1 : $0
//    })
    
//    let array = string.characters.map{ String($0) },
//     counted = NSCountedSet(array: array)
//    return counted.count(for: character)
    
//    let nonSpecificCharaterString = string.replacingOccurrences(of: "\(character)", with: "")
//    return string.characters.count - nonSpecificCharaterString.characters.count
    
    let result = string.characters.filter{
        $0 == character
    }
    return result.count
}

countCharacter("a", inString: "The rain in Spain")
countCharacter("i", inString: "Mississippi")
countCharacter("i", inString: "Hacking with Swift")

// 6 - Remove duplicate letters from a string
func removeDuplicateCharacterIn(_ string: String) -> String{
    
    var used = [Character: Bool]()
    
    let result = string.characters.filter {
        used.updateValue(true, forKey: $0) == nil
    }
    
    return String(result)
}

removeDuplicateCharacterIn("wombat")
removeDuplicateCharacterIn("hello")
removeDuplicateCharacterIn("Mississippi")

// 7 - Condense whitespace
func condenseWhitespaceOf(string: String) -> String {
//    var temp = string
//    for i in (1..<temp.characters.count).reversed() {
//        if temp[temp.index(temp.startIndex, offsetBy: i)] == " " &&
//            temp[temp.index(temp.startIndex, offsetBy: i - 1)] == " " {
//            temp.remove(at: temp.index(string.startIndex, offsetBy: i))
//        }
//    }
//    return temp
    
//    var seenPlace = false, result = ""
//    for c in string {
//        if c == " " {
//            if seenPlace { continue }
//            seenPlace = true
//        } else {
//            seenPlace = false
//        }
//        result.append(c)
//    }
//    return result
    
    return string.replacingOccurrences(of: " +", with: " ", options: .regularExpression)
}

condenseWhitespaceOf(string: "a   b   c")
condenseWhitespaceOf(string: "    a")
condenseWhitespaceOf(string: "abc")

// 8 - String is rotated
func isTwoStringRotated(string: String, string2: String) -> Bool {
    if Set(string) != Set(string2) {
        return false
    }
    let doulbeString = string + string
    return doulbeString.contains(string2)
}

isTwoStringRotated(string: "abcde", string2: "eabcd")
isTwoStringRotated(string: "abcde", string2: "cdeab")
isTwoStringRotated(string: "abcde", string2: "abced")
isTwoStringRotated(string: "abc", string2: "a")

// 9 - Find pangrams
func isPangrams(_ string: String) -> Bool {
    let set = Set(string.lowercased())
    let letters = set.filter {
        $0 >= "a" && $0 <= "z"
    }
    return letters.count == 26
}

isPangrams("The quick brown fox jumps over the lazy dog")
isPangrams("The quick brown fox jumped over,. the lazy dog")

// 10 - Vowels and consonants
func getNumberOfVowelsAndConsonants(of string: String) -> (vowels: Int, consonants: Int) {
    let vowelsString = "aeiou",
    letters = string.lowercased().filter {
        $0 >= "a" && $0 <= "z"
    }
    let vowelsCount = letters.reduce(0) { vowelsString.contains($1) ? $0 + 1 : $0 }
    return (vowelsCount, letters.characters.count - vowelsCount)
}

getNumberOfVowelsAndConsonants(of: "Swift Coding Challenges")
getNumberOfVowelsAndConsonants(of: "Mississippi")

// 11 - Three different letters
func hasAtmostThreeDifferentLetters(s: String, s2: String) -> Bool{
    let array = Array(s), array2 = Array(s2)
    if array.count != array2.count { return false }
    var result = 0
    for i in 0..<array.count {
        if array[i] != array2[i] {
            result += 1
            if result > 3 { return false }
        }
    }
    return true
}

hasAtmostThreeDifferentLetters(s: "Clamp", s2: "Cramp")
hasAtmostThreeDifferentLetters(s: "Clamp", s2: "Crams")
hasAtmostThreeDifferentLetters(s: "Clamp", s2: "Grams")
hasAtmostThreeDifferentLetters(s: "Clamp", s2: "Grans")
hasAtmostThreeDifferentLetters(s: "Clamp", s2: "Clam")
hasAtmostThreeDifferentLetters(s: "clamp", s2: "maple")

// 12 - Find longest prefix
func findLongestPrefix(of s: String) -> String {
    let words = s.components(separatedBy: " ")
    guard let first = words.first else { return "" }
    var currPrefix = "", bestPrefix = ""
    for letter in first.characters {
        currPrefix.append(letter)
        for word in words {
            if !word.hasPrefix(currPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currPrefix
    }
    return bestPrefix
}

findLongestPrefix(of: "swift switch swill swim")
findLongestPrefix(of: "flip flap flop")

// 13 - Run-length encoding
func getRunLengthEncoding(of s: String) -> String {
//    var result = "", count = 1, arrayS = Array(s)
//    for i in 0..<arrayS.count {
//        if i == arrayS.count - 1 || arrayS[i] != arrayS[i + 1] {
//            result.append("\(String(arrayS[i]) + String(count))")
//            count = 1
//        } else {
//            count += 1
//        }
//    }
//    return result
    
    var currLetter: Character?,
    result = "",
    letterCount = 0
    for c in s {
        if c == currLetter {
            letterCount += 1
        } else {
            if let currL = currLetter {
                result.append("\(currL)\(letterCount)")
            }
            letterCount = 1
            currLetter = c
        }
    }
    if let currL = currLetter {
        result.append("\(currL)\(letterCount)")
    }
    return result
}

getRunLengthEncoding(of: "aabbcc")
getRunLengthEncoding(of: "aaabaaabaaa")
getRunLengthEncoding(of: "aaAAaa")
getRunLengthEncoding(of: "swift switch swill swim")
getRunLengthEncoding(of: "flip flap flop")

// 14 - String permutations
func getPermutations(of s: String, current: String = "") {
    let length = s.characters.count,
    strArray = Array(s)
    
    if length == 0 {
        print(current)
    } else {
        for i in 0..<length {
            let left = String(strArray[0..<i]),
            right = String(strArray[i+1..<length])
            getPermutations(of: left + right, current: current + String(strArray[i]))
        }
    }
    
}

getPermutations(of: "a")
//print("*******************")
//getPermutations(of: "ab")
//print("*******************")
getPermutations(of: "abc")
print("*******************")
//getPermutations(of: "wombat")

// 15 - Reverse the words
func reverseWord(of s: String) -> String {
    let arrayWord = s.components(separatedBy: " ")
    
//    var result = arrayWord.reduce("") {
//        $0.appending(String($1.reversed()) + " ")
//    }
//    return String(result.dropLast())
    
    let reversedWord = arrayWord.map { String($0.reversed()) }
    return reversedWord.joined(separator: " ")
}

reverseWord(of: "Swift Coding Challenges")
reverseWord(of: "The quick brown fox")

// Mark - Number

// 16 - Fizz Buzz
func printFizzBuzz() {
//    for i in 1...100 {
//        if i % 15 == 0 {
//            print("Fizz Buzz")
//        } else if i % 3 == 0 {
//            print("Fizz")
//        } else if i % 5 == 0 {
//            print("Buzz")
//        } else {
//            print("\(i)")
//        }
//    }
    (1...100).forEach { print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" : $0 % 5 == 0 ? "Buzz" : "\($0)") }
}

printFizzBuzz()
print("*******************")

// 17 - Random number
func getRandomNumber(from min: Int, to max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max - min + 1))) + min
}

getRandomNumber(from: 1, to: 5)
getRandomNumber(from: 8, to: 10)
getRandomNumber(from: 12, to: 12)
getRandomNumber(from: 12, to: 18)

// 18 - Recreate pow() function
func myPow(n: Int, n2: Int) -> Int {
    guard n > 0, n2 > 0 else { return 0 }
    let numbers = [Int](repeating: n, count: n2)
    return numbers.reduce(1, { $0*$1 })
}

myPow(n: 2, n2: 8)
myPow(n: 4, n2: 3)

// 19 - Swap 2 numbers without using temporary variable
func swapTwoNumbers(n: inout Int, n2: inout Int) {
//    n2 = n + n2
//    n = n2 - n
//    n2 = n2 - n
    
    (n, n2) = (n2, n)
}

var a = 3, b = 5
print("\(a), \(b)")
swapTwoNumbers(n: &a, n2: &b)
print("\(a), \(b)")
print("*******************")

// 20 - Number is prime
func isPrime(number: Int) -> Bool{
    guard number > 1 else { return false }
    if number == 2 { return true }
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 { return false }
    }
    return true
}

isPrime(number: 11)
isPrime(number: 13)
isPrime(number: 4)
isPrime(number: 9)
isPrime(number: 16777259)

// 21 - Couting binary ones
func getNextHighestAndLowestHaveSameNumberBits1(with number: Int) -> (nextHighest: Int?, nextLowest: Int?){
    func ones(of number: Int) -> Int {
        let binaryString = String(number, radix: 2)
        return binaryString.characters.reduce(0) { $1 == "1" ? $0 + 1 : $0 }
    }
    
    let targetOnes = ones(of: number)
    var nextHighest: Int? = nil,
    nextLowest: Int? = nil
    for i in number + 1...Int.max {
        if ones(of: i) == targetOnes {
            nextHighest = i
            break
        }
    }
    for i in (0..<number).reversed() {
        if ones(of: i) == targetOnes {
            nextLowest = i
            break
        }
    }
    
    return (nextHighest, nextLowest)
}

getNextHighestAndLowestHaveSameNumberBits1(with: 28)
getNextHighestAndLowestHaveSameNumberBits1(with: 12)

// 22 - Binary reversed
func getBinaryReverse(of number: Int) -> Int {
    let binary = String(number, radix: 2)
    let paddingAmount = 8 - binary.characters.count
    let paddingBinary = String(repeating: "0", count: paddingAmount) + binary
    
    return Int(String(paddingBinary.reversed()), radix: 2)!
}

getBinaryReverse(of: 32)
getBinaryReverse(of: 41)

// 23 - Integer diguised as string
func isContainNumberOnly(of s: String) -> Bool {
//    let nonNumberString = s.filter { Int("\($0)") == nil }
//    return nonNumberString.characters.count == 0
    
//    return s.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    
    return s.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted ) == nil
}

isContainNumberOnly(of: "010101")
isContainNumberOnly(of: "123456789")
isContainNumberOnly(of: "922873692928302928163738")
isContainNumberOnly(of: "1.01")

// 24 - Add number inside a string
func getSumOfNumber(inside s: String) -> Int {
//    let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
//    let matches = regex.matches(in: s, options: [], range: NSRange(location: 0, length: s.utf16.count))
//    let allNumbers = matches.flatMap { Int((s as NSString).substring(with: $0.range)) }
//    return allNumbers.reduce(0, +)
    
    var currentNumberString = "", sum = 0
    for c in s {
        if Int("\(c)") != nil {
            currentNumberString.append(c)
        } else {
            sum += Int(currentNumberString) ?? 0
            currentNumberString = ""
        }
    }
    sum += Int(currentNumberString) ?? 0
    return sum
}

getSumOfNumber(inside: "a1b2c3")
getSumOfNumber(inside: "a10b20c30")
getSumOfNumber(inside: "h8rs")

// 25 - Calculate a square root by hand
func getSquareRoot(of number: Int) -> Int {
//    return Int(pow(Double(number), 0.5))
    
    if number == 1 { return 1 }
    var b = 1, e = number / 2 + 1
    while b + 1 < e {
        let mid = b - (b - e)/2,
        squareNumber = mid*mid
        if squareNumber > number {
            e = mid
        } else if squareNumber < number {
            b = mid
        } else {
            return mid
        }
    }
    return b
}

getSquareRoot(of: 9)
getSquareRoot(of: 16777216)
getSquareRoot(of: 16)
getSquareRoot(of: 15)
getSquareRoot(of: 4)
getSquareRoot(of: 2)
getSquareRoot(of: 1)

// 26 - Subtract without subtract
func subtract(_ n: Int, from n2: Int) -> Int {
//    return n2 + -1 * n
    
    print(~n)
    return n2 + (~n + 1)
}

subtract(5, from: 9)
subtract(10, from: 30)
subtract(0, from: 32)
subtract(9, from: 9)
subtract(9, from: 5)
print("*******************")

// 37 - Count the number
extension Collection where Element == Int  {
    func count(_ s: Character) -> Int {
        return self.reduce(0, {
            let sameDidgitString = String($1).characters.filter{ $0 == s }
            return $0 + sameDidgitString.count
        })
    }
}

[5, 15, 515, 55].count("5")
[5, 15, 515, 55].count("1")
[5555].count("1")
[5555].count("5")

// 38 - Find N smallest
extension Collection where Element: Comparable {
    func getNSmallest(_ n: Int) -> [Element] {
        let result = self.sorted { $0 < $1 }
        return Array(result.prefix(n))
    }
}

[3, 2, 4, 1].getNSmallest(3)
["q", "f", "k"].getNSmallest(3)
[256, 16].getNSmallest(3)
[String]().getNSmallest(3)

// 39 - Sort a string array by length
extension Collection where Element == String {
    func sortByLength() -> [Element] {
        return self.sorted { $0.characters.count > $1.characters.count }
    }
}

["a", "abc", "ab"].sortByLength()
["paul", "taylor", "adele"].sortByLength()
[String]().sortByLength()

// 40 - get missing numbers in array
func getMissingNumbers(from array: [Int]) -> [Int] {
    let set = Set(array), set2 = Set(1...100)
    return Array(set.symmetricDifference(set2)).sorted()
}

var array = Array(1...100)
array.remove(at: 25)
array.remove(at: 20)
array.remove(at: 6)
array.remove(at: 77)

getMissingNumbers(from: array)

// 41 - Find the median
extension Collection where Element == Int {
    func findMedian() -> Double? {
        if self.count == 0 { return nil }
        let sorted = self.sorted(),
        mid = sorted.count / 2
        if sorted.count % 2 == 0 {
            return Double((sorted[mid] + sorted[mid - 1])) / 2
        } else {
            return Double(sorted[mid])
        }
    }
}

[1, 2, 3].findMedian()
[1, 2, 9].findMedian()
[1, 3, 5, 7, 9].findMedian()
[1, 2, 3, 4].findMedian()
[1, 2, 3, 10, 9, 8].findMedian()
[Int]().findMedian()

// 42 - Reimplement index(of:)
extension Collection where Element: Equatable{
    func myIndex(of e: Element) -> Int? {
        for (index, item) in self.enumerated() {
            if item == e {
                return index
            }
        }
        return nil
    }
}

[1, 2, 3].myIndex(of: 1)
[1, 2, 3].myIndex(of: 3)
[1, 2, 3].myIndex(of: 5)

// 43 - Linked list
class LinkedListNode<T> {
    var value: T
    var nextNode: LinkedListNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var start: LinkedListNode<T>?
    
    func printLinkedList() {
        var current = start
        while let pointer = current {
            print(pointer.value, terminator: " ")
            current = pointer.nextNode
        }
    }
}

func createAlphabetLinkedList() ->LinkedList<Character> {
    let linkedList = LinkedList<Character>()
    var previousNode: LinkedListNode<Character>? = nil
    "abcdefghijklmnopqrstuvwxyz".characters.forEach {
        let pointer = LinkedListNode<Character>(value: $0)
        if let predecessor = previousNode {
            predecessor.nextNode = pointer
        } else {
            linkedList.start = pointer
        }
        previousNode = pointer
    }
    return linkedList
}

let alphabetLinkedList = createAlphabetLinkedList()
alphabetLinkedList.printLinkedList()
print("\n*******************")

// 44 - Linked list mid-point
extension LinkedList {
    func getLinkedListMidPoint() -> T? {
        var slower = self.start,
        faster = self.start
        while faster != nil && faster?.nextNode?.nextNode != nil {
            faster = faster?.nextNode?.nextNode
            slower = slower?.nextNode
        }
        return slower?.value
    }
}

alphabetLinkedList.getLinkedListMidPoint()

// 54 - Binary search tree
class Node<T>{
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    init(_ array: [T]) {
        for value in array {
            insert(value: value)
        }
    }
    
    func insert(value: T) {
        insert(value: value, to: &root)
    }
    
    private func insert(value: T, to node: inout Node<T>?) {
        if let node = node {
            if value < node.value {
                if node.left != nil {
                    insert(value: value, to: &node.left)
                } else {
                    node.left = Node<T>(value: value)
                }
            } else {
                if node.right != nil {
                    insert(value: value, to: &node.right)
                } else {
                    node.right = Node<T>(value: value)
                }
            }
        } else {
            node = Node<T>(value: value)
        }
    }
    
    func isBalanced() -> Bool {
        func minDepth(of node:Node<T>?) -> Int {
            guard let node = node else {
                return 0
            }
            let returnValue = 1 + min(minDepth(of: node.left),                  minDepth(of: node.right))
            return returnValue
        }
        func maxDepth(of node:Node<T>?) -> Int {
            guard let node = node else {
                return 0
            }
            let returnValue = 1 + max(maxDepth(of: node.left),                  maxDepth(of: node.right))
            return returnValue
        }
        guard let root = root else { return true }
        let diff = maxDepth(of: root) - minDepth(of: root)
        return diff <= 1
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let first = root else {
            return "(Empty)"
        }
        var queue = [Node<T>]()
        queue.append(first)
        var output = ""
        while queue.count > 0 {
            var nodesAtCurrentLevel = queue.count
            while nodesAtCurrentLevel > 0 {
                let node = queue.removeFirst()
                output += "\(node.value) "
                if node.left != nil { queue.append(node.left!)}
                if node.right != nil { queue.append(node.right!)}
                nodesAtCurrentLevel -= 1
            }
            output += "\n"
        }
        return output
    }
}

let bnst = BinarySearchTree<Int>([10, 5, 4, 3, 2, 1, 11, 12, 13, 14, 15])
print(bnst.description)
bnst.isBalanced()

//let bnst2 = BinarySearchTree<Int>([4, 8, -4, 5, 12, 7, 8])
//print(bnst2.description)

