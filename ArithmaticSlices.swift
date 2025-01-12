//
//  ArithmaticSlices.swift
//  TheS30-SwiftTests
//
//  Created by Malav Soni on 11/01/25.
//

import Testing

struct ArithmaticSlices {
    
    struct TestCase {
        let nums:[Int]
        let expectedCount:Int
    }
    
    static let testCases: [TestCase] = [
        TestCase(nums: [1,2,3,4], expectedCount: 3)
    ]
    
    func numberOfArithmeticSlices_brute_force(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        
        var count = 0
        for i in 0..<nums.count - 2 {
            for j in (i+2)..<nums.count {
                if nums[j] - nums[j - 1] == nums[j-1] - nums[j - 2] {
                    count += 1
                } else {
                    break
                }
            }
        }
        return count
    }
    
    func numberOfArithmeticSlices_dp(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var memo:[Int] = [Int].init(repeating: 0, count: nums.count)
        var count = 0
        for i in 2..<nums.count {
            if nums[i] - nums[i - 1] == nums[i-1] - nums[i - 2] {
                memo[i] = memo[i - 1] + 1
                count += memo[i]
            }
        }
        return count
    }
    
    @Test("Find all the arithmatic slices - Brute Force", .tags(.dp), arguments: ArithmaticSlices.testCases)
    func findNumberOfArithmaticSlices_brute_force(argument:TestCase) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(numberOfArithmeticSlices_brute_force(argument.nums) == argument.expectedCount)
    }
    
    @Test("Find all the arithmatic slices - Brute Force", .tags(.dp), arguments: ArithmaticSlices.testCases)
    func findNumberOfArithmaticSlices_dp(argument:TestCase) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(numberOfArithmeticSlices_dp(argument.nums) == argument.expectedCount)
    }
    
}
