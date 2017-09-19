//
//  HackerRankTest.swift
//  PracticeAlgorithm
//
//  Created by Dinh Thanh An on 9/18/17.
//  Copyright © 2017 Dinh Thanh An. All rights reserved.
//

import Foundation

class HackerRank {
    func leftRotationArray(_ a: inout [Int], _ d: Int) -> [Int] {
        
        // readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        reverseArray(&a, 0, d - 1)
        reverseArray(&a, d, a.count - 1)
        reverseArray(&a, 0, a.count - 1)
        
        print(a.map({ String($0) }).joined(separator: " "))
        
        return a
    }
    
    internal func reverseArray(_ a: inout [Int], _ begin: Int, _ end: Int) {
        var b = begin
        var e = end
        while b < e {
            swap(&a[b], &a[e])
            b = b + 1
            e = e - 1
        }
    }
    
    func deletedNumberToMakeAnagrams(_ a: String, _ b: String) -> Int {
        var frequencyCharacterDictA = [String: Int]()
        for c in a.characters {
            if frequencyCharacterDictA["\(c)"] == nil {
                frequencyCharacterDictA["\(c)"] = 1
                
            } else {
                frequencyCharacterDictA["\(c)"] = frequencyCharacterDictA["\(c)"]! + 1
            }
        }
        
        var frequencyCharacterDictB = [String: Int]()
        for c in b.characters {
            if frequencyCharacterDictB["\(c)"] == nil {
                frequencyCharacterDictB["\(c)"] = 1
                
            } else {
                frequencyCharacterDictB["\(c)"] = frequencyCharacterDictB["\(c)"]! + 1
            }
        }
        
        var result = 0
        for (key, value) in frequencyCharacterDictA {
            if let temp = frequencyCharacterDictB[key] {
                result = result + abs(value - temp)
                frequencyCharacterDictB[key] = 0
            } else {
                result = result + value
            }
        }
        for (_, value) in frequencyCharacterDictB {
            if value > 0 {
                result = result + value
            }
        }
        
        return result
    }
    
    func canRansomNote(_ a: String, _ b: String) -> Bool {
        var freqCharactersA = [String: Int]()
        for w in a.components(separatedBy: " ") {
            if freqCharactersA["\(w)"] == nil {
                freqCharactersA["\(w)"] = 1
                
            } else {
                freqCharactersA["\(w)"] = freqCharactersA["\(w)"]! + 1
            }
        }
        
        var freqCharactersB = [String: Int]()
        for w in b.components(separatedBy: " ") {
            if freqCharactersB["\(w)"] == nil {
                freqCharactersB["\(w)"] = 1
                
            } else {
                freqCharactersB["\(w)"] = freqCharactersB["\(w)"]! + 1
            }
        }
        for (key, value) in freqCharactersB {
            if let temp = freqCharactersA[key] {
                if temp < value {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isBalancedBrackets(_ a: String) -> Bool {
        if a.characters.count % 2 != 0 {
            return false
        }
        let stack = parseBrackets(a)
        return true
    }
    
    internal func parseBrackets(_ s: String) -> [Int] {
        var stack = [Int]()
        for c in s.characters {
            switch c {
            case "(":
                stack.append(1)
            case "[":
                stack.append(2)
            case "{":
                stack.append(3)
            case ")":
                stack.append(-1)
            case "]":
                stack.append(-2)
            case "}":
                stack.append(-3)
            default:
                break
            }
        }
        
        return stack
    }
}
