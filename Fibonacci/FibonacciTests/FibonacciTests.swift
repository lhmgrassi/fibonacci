//
//  FibonacciTests.swift
//  FibonacciTests
//
//  Created by Luis Henrique Grassi on 11/07/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import XCTest
@testable import Fibonacci

class FibonacciTests: XCTestCase {
    
    var fibonacci : FibonacciHelper!
    
    override func setUp() {
        super.setUp()
        fibonacci = FibonacciHelper()
    }
    
    override func tearDown() {
        fibonacci = nil
        super.tearDown()
    }
    
    func testFibonacciResult() {
        
        let result0 = fibonacci.fibonacci(0)
        assert(result0 == 0, "fibonacci(0) should be 0")

        let result1 = fibonacci.fibonacci(1)
        assert(result1 == 1, "fibonacci(0) should be 1")

        let result2 = fibonacci.fibonacci(2)
        assert(result2 == 1, "fibonacci(0) should be 1")

        let result3 = fibonacci.fibonacci(3)
        assert(result3 == 2, "fibonacci(0) should be 2")
        
        let result4 = fibonacci.fibonacci(4)
        assert(result4 == 3, "fibonacci(0) should be 3")

        assert(fibonacci.cache[3] != nil, "should have cache for index 3")
        assert(fibonacci.cache[4] != nil, "should have cache for index 4")
        
        let result5 = fibonacci.fibonacci(5)
        assert(result5 == 5, "fibonacci(0) should be 5")

        let result9 = fibonacci.fibonacci(9)
        assert(result9 == 34, "fibonacci(0) should be 34")
       
        assert(fibonacci.cache[9] != nil, "should have cache for index 9")
        

    }
    
    
}

