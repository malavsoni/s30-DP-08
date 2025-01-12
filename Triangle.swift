//
//  Triangle.swift
//  TheS30-SwiftTests
//
//  Created by Malav Soni on 11/01/25.
//

import Testing

struct Triangle {
    
    struct TestCase {
        let input:[[Int]]
        let output:Int
    }
    
    static let testCases: [TestCase] = [
        TestCase(input: [[2],[3,4],[6,5,7],[4,1,8,3]], output: 11)
    ]
    
    func minimumTotal_void_based_recursion(_ triangle: [[Int]]) -> Int {
        
        var minimum:Int = Int.max
        
        func traverse(i:Int, j:Int, sum:Int) {
            if (i == triangle.count) {
                minimum = min(minimum, sum)
                return
            }
            
            traverse(i: i+1, j: j, sum: sum + triangle[i][j])
            traverse(i: i+1, j: j+1, sum: sum + triangle[i][j])
        }
        
        traverse(i: 0, j: 0, sum: 0)
        
        return minimum;
    }
    
    func minimumTotal_int_based_recursion(_ triangle: [[Int]]) -> Int {
        func traverse(i:Int, j:Int, sum:Int) -> Int {
            if (i == triangle.count) {
                return sum
            }
            
            let first = traverse(i: i+1, j: j, sum: sum + triangle[i][j])
            let second = traverse(i: i+1, j: j+1, sum: sum + triangle[i][j])
            return min(first, second)
        }
        return traverse(i: 0, j: 0, sum: 0)
    }
    
    func minimumTotal_upward_recursion(_ triangle: [[Int]]) -> Int {
        var memo:[[Int]] = [[Int]].init(repeating: [Int].init(repeating: Int.max, count: triangle.count), count: triangle.count)
        func traverse(i:Int, j:Int) -> Int {
            if (i == triangle.count) {
                return 0
            }
            
            if (memo[i][j] != Int.max) {
                return memo[i][j]
            }
            
            let first = traverse(i: i+1, j: j)
            let second = traverse(i: i+1, j: j+1)
            let result = triangle[i][j] + min(first, second)
            
            memo[i][j] = result
            return result
            
        }
        return traverse(i: 0, j: 0)
    }
    
    @Test("Find the minimum path to the leaf node - Void Based Recursion", .tags(.dfs, .voidBasedRecursion), arguments: Triangle.testCases)
    func findMinimumTotal_void_dfs(arguments: TestCase) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(minimumTotal_void_based_recursion(arguments.input) == arguments.output)
    }
    
    @Test("Find the minimum path to the leaf node - Int Based Recursion", .tags(.dfs, .voidBasedRecursion), arguments: Triangle.testCases)
    func findMinimumTotal_int_dfs(arguments: TestCase) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(minimumTotal_int_based_recursion(arguments.input) == arguments.output)
    }
    
    @Test("Find the minimum path to the leaf node - int Based Upward Recursion", .tags(.dfs, .voidBasedRecursion), arguments: Triangle.testCases)
    func findMinimumTotal_int_upward_dfs(arguments: TestCase) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(minimumTotal_upward_recursion(arguments.input) == arguments.output)
    }
    
}
