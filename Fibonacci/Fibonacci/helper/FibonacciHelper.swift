//
//  FibonacciHelper.swift
//
//
//  Created by Luis Henrique Grassi on 11/07/17.
//  Copyright © 2017 lhmgrassi. All rights reserved.
//

import UIKit

protocol FibonacciProtocol {
    func fibonacci(_ n: Int) -> Double
}

class FibonacciHelper: NSObject, FibonacciProtocol {
    
    //https://gist.github.com/getaaron/939e27ff62bd99aba788aae8c3f5fcbc
    
    var cache = [Int:Double]()
    
    func fibonacci(_ n: Int) -> Double {

        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        }
        
        if let cached = cache[n] {
            return cached
        }
        
        print("calculating f(\(n))")
        
        let n1 = fibonacci(n - 1)
        let n2 = fibonacci(n - 2)
        let result = n1 + n2
        
        cache[n] = result
        
        return result
    }
    
}
