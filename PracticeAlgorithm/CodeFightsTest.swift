//
//  CodeFightsTest.swift
//  PracticeAlgorithm
//
//  Created by Dinh Thanh An on 9/13/17.
//  Copyright © 2017 Dinh Thanh An. All rights reserved.
//

import Foundation

class CodeFightsTest {
    func firstDuplicate(_ a: [Int]) -> Int {
        var occuranceArray = [Int](repeating: 0, count: a.count + 1)
        for i in 0..<a.count {
            let number = a[i]
            if occuranceArray[number] == 1 {
                return number
            }
            occuranceArray[number] = occuranceArray[number] + 1
        }
        
        return -1
    }
    
    func firstNotRepeatingCharacter(s: String) -> Character {
        var uniqueCharacterString = ""
        var repeatedCharacterString = ""
        for c in s.characters {
            if !uniqueCharacterString.contains("\(c)") {
                uniqueCharacterString = uniqueCharacterString.appending("\(c)")
            } else if !repeatedCharacterString.contains("\(c)"){
                repeatedCharacterString = repeatedCharacterString.appending("\(c)")
            }
        }
        
        for c in repeatedCharacterString.characters {
            uniqueCharacterString = uniqueCharacterString.replacingOccurrences(of: "\(c)", with: "")
        }
        
        return uniqueCharacterString.characters.count > 0 ? uniqueCharacterString.characters.first! : "_"
    }
    
    func isCryptSolution(crypt: [String], solution: [[Character]]) -> Bool {
        var solutionDict = [String: String]()
        
        for s in solution {
            solutionDict["\(s[0])"] = "\(s[1])"
        }
        
        var encryptedArray = [Int]()
        
        for c in crypt {
            let encryptString = encrypt(s: c, solution: solutionDict)
            if encryptString[encryptString.startIndex] == "0" && encryptString.characters.count > 1 {
                return false
            }
            encryptedArray.append(Int("\(encryptString)")!)
        }
        
        return encryptedArray[0] + encryptedArray[1] == encryptedArray[2]
    }
    
    internal func encrypt(s: String, solution: [String: String]) -> String {
        var result = ""
        for c in s.characters {
            result = result.appending(solution["\(c)"]!)
        }
        
        return result
    }

    func rotateImage(a: inout [[Int]]) -> [[Int]] {
        if a.count <= 1 {
            return a
        }
        for n in 0...a.count - 2 {
            for m in n + 1...a.count - 1 {
                swap(&a[n][m], &a[m][n])
            }
        }
        for n in 0..<a.count {
            for m in 0..<a.count / 2 {
                if m != a.count - 1 - m {
                    swap(&a[n][m], &a[n][a.count - 1 - m])
                }
            }
        }
        
        return a
    }
    
    func sudoku2(grid: [[Character]]) -> Bool {
        var set = Set<String>()
        for r in 0..<grid.count{
            for c in 0..<grid.count {
                if grid[r][c] != "." {
                    let rowString = "row \(r) - value: \(grid[r][c])"
                    let colString = "col \(c) - value: \(grid[r][c])"
                    let subArrayString = "sub [\(r/3)|\(c/3)] - value: \(grid[r][c])"
                    if set.contains(rowString) ||  set.contains(colString) || set.contains(subArrayString){
                        return false
                    } else {
                        set.insert(rowString)
                        set.insert(colString)
                        set.insert(subArrayString)
                    }
                }
            }
        }
        
        return true
    }
    
    // Definition for singly-linked list:
     public class ListNode<T> {
         public var value: T
         public var next: ListNode<T>?
         public init(_ x: T) {
             self.value = x
             self.next = nil
         }
     }
    
    func removeKFromList(l: ListNode<Int>?, k: Int) -> ListNode<Int>? {
        var pointer = l
        
        // remove all node with value k in list (except head node)
        while pointer != nil && pointer?.next != nil{
            if pointer?.next?.value == k {
                pointer?.next = pointer?.next?.next
                
            } else {
                pointer = pointer?.next
            }
        }
        
        // check if head node has value k
        return l?.value == k ? l?.next : l
    }
    
    func isListPalindrome(l: ListNode<Int>?) -> Bool {
        var slowPtr = l, fastPtr = l,
        secondHalf: ListNode<Int>? = nil,
        prevOfSlowPtr = l, res = true
        
        if l != nil && l?.next != nil {
            /* Get the middle of the list. Move slow_ptr by 1
             and fast_ptrr by 2, slow_ptr will have the middle
             node */
            while fastPtr != nil && fastPtr?.next != nil {
                fastPtr = fastPtr?.next?.next
                
                /*We need previous of the slow_ptr for
                 linked lists  with odd elements */
                prevOfSlowPtr = slowPtr
                slowPtr = slowPtr?.next
            }
            
            /* fast_ptr would become NULL when there are even elements in list.
             And not NULL for odd elements. We need to skip the middle node
             for odd case and store it somewhere so that we can restore the
             original list*/
            if fastPtr != nil {
                slowPtr = slowPtr?.next
            }
            
            // Now reverse the second half and compare it with first half
            secondHalf = slowPtr
            prevOfSlowPtr?.next = nil
            reverseList(l: &secondHalf)
            res = compareList(l: l, l2: secondHalf)
        }
        
        return res
    }
    
    // reverse list head->1->2->3->4 to be 1<-2<-3<-4<-head
    internal func reverseList(l: inout ListNode<Int>?){
        var prev: ListNode<Int>? = nil,
        current = l,
        next: ListNode<Int>? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        l = prev
    }
    
    internal func compareList(l: ListNode<Int>?, l2: ListNode<Int>?) -> Bool {
        var temp1 = l
        var temp2 = l2
        
        while temp1 != nil && temp2 != nil {
            if temp1?.value == temp2?.value {
                temp1 = temp1?.next
                temp2 = temp2?.next
                
            } else {
                return false
            }
        }
        
        if temp1 == nil && temp2 == nil {
            return true
        }
        
        return false
    }
}
